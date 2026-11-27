# frozen_string_literal: true

require 'net/http/persistent'
require 'securerandom'
require 'uri'
require 'zlib'
require 'stringio'
require 'onlinepayments/sdk/communication/communication_exception'
require 'onlinepayments/sdk/communication/multipart_form_data_object'
require 'onlinepayments/sdk/communication/pooled_connection'
require 'onlinepayments/sdk/communication/response_header'
require 'onlinepayments/sdk/logging/obfuscation/body_obfuscator'
require 'onlinepayments/sdk/logging/obfuscation/header_obfuscator'
require 'onlinepayments/sdk/logging/request_log_message_builder'
require 'onlinepayments/sdk/logging/response_log_message_builder'

module OnlinePayments
  module SDK
    module Communication
      class DefaultConnection < PooledConnection
        CONTENT_TYPE = 'Content-Type'
        JSON_CONTENT_TYPE = 'application/json'
        CONTENT_ENCODING = 'Content-Encoding'
        PROXY_ENVIRONMENT_VARIABLES = %w[https_proxy HTTPS_PROXY http_proxy HTTP_PROXY].freeze
        NO_PROXY_ENVIRONMENT_VARIABLES = %w[no_proxy NO_PROXY].freeze
        FORM_DATA_NAME_ESCAPES = { '"' => '%22', "\r" => '%0D', "\n" => '%0A' }.freeze
        HTTP_REQUEST_CLASSES = {
          'get' => Net::HTTP::Get,
          'delete' => Net::HTTP::Delete,
          'post' => Net::HTTP::Post,
          'put' => Net::HTTP::Put
        }.freeze
        private_constant :CONTENT_TYPE, :JSON_CONTENT_TYPE, :CONTENT_ENCODING, :PROXY_ENVIRONMENT_VARIABLES,
                         :NO_PROXY_ENVIRONMENT_VARIABLES, :FORM_DATA_NAME_ESCAPES, :HTTP_REQUEST_CLASSES

        # @param args [Hash] the parameters to initialize the connection with
        # @option args [Integer] :connect_timeout connection timeout in seconds.
        # @option args [Integer] :socket_timeout socket timeout in seconds.
        # @option args [Integer] :max_connections number of connections kept alive in the thread pool.
        #              Uses {OnlinePayments::SDK::CommunicatorConfiguration.default_max_connections} if not given.
        # @option args [OnlinePayments::SDK::ProxyConfiguration] :proxy_configuration object that stores the proxy to use.
        #              If not given the system default proxy is used;
        #              if there is no system default proxy set either, no proxy is used.
        def initialize(args)
          super()
          raise ArgumentError unless args.is_a? Hash

          # Set timeouts to nil if they are negative
          @connect_timeout = args[:connect_timeout]
          @connect_timeout = nil unless @connect_timeout.nil? || @connect_timeout > 0
          @socket_timeout = args[:socket_timeout]
          @socket_timeout = nil unless @socket_timeout.nil? || @socket_timeout > 0
          @max_connections = args[:max_connections] || CommunicatorConfiguration.default_max_connections
          @proxy_configuration = args[:proxy_configuration]

          @http = Net::HTTP::Persistent.new(name: 'onlinepayments-sdk-ruby')
          @http.open_timeout = @connect_timeout
          @http.read_timeout = @socket_timeout
          @http.write_timeout = @socket_timeout
          @http.max_retries = 0
          @http.proxy = proxy_uri
          @servers = Set.new
          @servers_mutex = Mutex.new

          @body_obfuscator = OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator.default_obfuscator
          @header_obfuscator = OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator.default_obfuscator
        end

        # Sets the idle timeout to _idle_time_ seconds. Connections idle longer than that are closed lazily.
        def close_idle_connections(idle_time)
          @http.idle_timeout = idle_time
        end

        # Expired connections are closed automatically, so _close_expired_connections_ is a no-operation.
        def close_expired_connections; end

        # Closes all connections. A new connection is opened for the next request.
        def close
          @http.reload
          @servers_mutex.synchronize { @servers.clear }
        end

        # Returns the number of servers that requests were sent to since this connection was created or last closed.
        def session_count
          @servers_mutex.synchronize { @servers.size }
        end

        # Performs a GET request to the Online Payments platform
        # @see request
        def get(uri, request_headers, &)
          request('get', uri, request_headers, &)
        end

        # Performs a DELETE request to the Online Payments platform
        # @see request
        def delete(uri, request_headers, &)
          request('delete', uri, request_headers, &)
        end

        # Performs a POST request to the Online Payments platform
        # @see request
        def post(uri, request_headers, body, &)
          request('post', uri, request_headers, body, &)
        end

        # Performs a PUT request to the Online Payments platform
        # @see request
        def put(uri, request_headers, body, &)
          request('put', uri, request_headers, body, &)
        end

        # Performs a HTTP request and yields the response as the status code, headers and body.
        # Also ensures the request is logged when sent and its response is logged when received.
        # Errors raised by the given block are not treated as communication errors and are raised unchanged.
        #
        # @param method          [String] 'GET', 'DELETE', 'POST' or 'PUT' depending on the HTTP method being used.
        # @param uri             [URI::HTTP] full URI of the location the request is targeted at, including query parameters.
        # @param request_headers [Array<OnlinePayments::SDK::Communication::RequestHeader>] list of headers that should be used as HTTP headers in the request.
        # @param body            [String, OnlinePayments::SDK::Communication::MultipartFormDataObject] request body.
        # @yield (Integer, Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO) The status code, headers and body of the response.
        # @raise [OnlinePayments::SDK::Communication::CommunicationException] when communication with the Online Payments platform was not successful.
        def request(method, uri, request_headers, body = nil)
          request_headers = convert_from_sdk_headers(request_headers)
          request_id = SecureRandom.uuid
          content_type = request_headers[CONTENT_TYPE]

          original_body_for_logging = body

          encoding_present = request_headers.keys.any? { |k| k.casecmp(CONTENT_ENCODING).zero? }

          if body.is_a?(String) &&
             content_type&.downcase&.start_with?(JSON_CONTENT_TYPE) &&
             encoding_present

            gzip_buffer = StringIO.new
            gzip = Zlib::GzipWriter.new(gzip_buffer)
            gzip.write(body)
            gzip.close
            body = gzip_buffer.string
          end

          info = { headers: request_headers, content_type: content_type, body: original_body_for_logging }

          log_request(request_id, method.upcase, uri, info)

          start_time = Time.now
          block_failed = false
          begin
            @http.request(uri, create_http_request(method, uri, request_headers, body)) do |response|
              response_status_code = response.code.to_i
              response_headers = convert_to_sdk_response_headers(response)
              response_content_type = response[CONTENT_TYPE]
              response_body = ''

              if binary_content_type?(response_content_type)
                response_body_io = ResponseBodyReader.new(response)
              else
                response_body = String.new(response.read_body.to_s, encoding: Encoding::UTF_8)
                response_body_io = StringIO.new(response_body)
              end

              log_response(request_id, response_status_code, start_time,
                           headers: response_headers, body: response_body,
                           content_type: response_content_type)

              begin
                yield response_status_code, response_headers, response_body_io
              rescue ResponseBodyReader::ReadError => e
                raise e.cause
              rescue StandardError
                block_failed = true
                raise
              end

              response_body_io.drain if response_body_io.is_a?(ResponseBodyReader)
            end
            @servers_mutex.synchronize { @servers << "#{uri.scheme}://#{uri.host}:#{uri.port}" }
          rescue StandardError => e
            raise if block_failed

            log_error(request_id, start_time, e)
            raise CommunicationException, e
          end
        end

        # logging code

        # Sets the current body obfuscator to use.
        # @param body_obfuscator [OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator]
        def body_obfuscator=(body_obfuscator)
          raise ArgumentError, 'body_obfuscator is required' unless body_obfuscator

          @body_obfuscator = body_obfuscator
        end

        # Sets the current header obfuscator to use.
        # @param header_obfuscator [OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator]
        def header_obfuscator=(header_obfuscator)
          raise ArgumentError, 'header_obfuscator is required' unless header_obfuscator

          @header_obfuscator = header_obfuscator
        end

        # Enables logging outgoing requests and incoming responses by registering the _communicator_logger_.
        # Note that only one logger can be registered at a time and calling _enable_logging_
        # a second time will override the old logger instance with the new one.
        #
        # @param communicator_logger [OnlinePayments::SDK::Logging::CommunicatorLogger] the communicator logger the requests and responses are logged to
        def enable_logging(communicator_logger)
          raise ArgumentError, 'communicator_logger is required' unless communicator_logger

          @communicator_logger = communicator_logger
        end

        # Disables logging by unregistering any previous logger that might be registered.
        def disable_logging
          @communicator_logger = nil
        end

        # Reads the body of a binary response in parts, while the caller reads it.
        class ResponseBodyReader
          # Raised when reading the response body fails.
          class ReadError < StandardError; end

          def initialize(response)
            @parts = Enumerator.new { |yielder| response.read_body { |part| yielder << part } }
            @buffer = String.new(encoding: Encoding::BINARY)
            @eof = false
          end

          # Reads _length_ bytes, or the rest of the body if _length_ is not given.
          #
          # @return [String, nil] the data read, or nil if _length_ is given and the end of the body is reached
          def read(length = nil, outbuf = nil)
            fill_buffer(length)
            data = length.nil? ? @buffer.slice!(0..) : @buffer.slice!(0, length)
            return nil if length&.positive? && data.empty?

            outbuf ? outbuf.replace(data) : data
          end

          # Reads and discards the rest of the body.
          def drain
            @buffer.clear
            @buffer.clear until next_part.nil?
          end

          private

          def fill_buffer(length)
            while length.nil? || @buffer.bytesize < length
              part = next_part
              break if part.nil?

              @buffer << part
            end
          end

          def next_part
            return nil if @eof

            @parts.next
          rescue StopIteration
            @eof = true
            nil
          rescue StandardError => e
            raise ReadError, e.message
          end
        end
        private_constant :ResponseBodyReader

        private

        def proxy_uri
          return configured_proxy_uri if @proxy_configuration

          environment_proxy_uri
        end

        def configured_proxy_uri
          uri = URI(@proxy_configuration.proxy_uri)
          unless @proxy_configuration.username.nil?
            uri.user = URI.encode_www_form_component(@proxy_configuration.username)
            uri.password = URI.encode_www_form_component(@proxy_configuration.password) unless @proxy_configuration.password.nil?
          end
          uri
        end

        def environment_proxy_uri
          proxy = ENV.values_at(*PROXY_ENVIRONMENT_VARIABLES).find { |value| value && !value.strip.empty? }
          return nil if proxy.nil?

          no_proxy = ENV.values_at(*NO_PROXY_ENVIRONMENT_VARIABLES).find { |value| value && !value.strip.empty? }
          return nil if no_proxy&.strip == '*'

          uri = URI(proxy.include?('://') ? proxy : "http://#{proxy}")
          uri.query = URI.encode_www_form(no_proxy: no_proxy) if no_proxy
          uri
        end

        def create_http_request(method, uri, headers, body)
          http_request = HTTP_REQUEST_CLASSES.fetch(method).new(uri)
          headers.each { |name, value| http_request[name] = value }
          if body.is_a? MultipartFormDataObject
            http_request.set_form(multipart_form_data(body), 'multipart/form-data', boundary: body.boundary)
          elsif http_request.request_body_permitted?
            http_request.body = body || ''
          end
          http_request
        end

        def multipart_form_data(body)
          files = body.files.map do |name, file|
            [escape_form_data_name(name), file.content,
             { filename: escape_form_data_name(file.file_name), content_type: file.content_type }]
          end
          values = body.values.map { |name, value| [escape_form_data_name(name), value] }
          files + values
        end

        def escape_form_data_name(name)
          name.to_s.gsub(/["\r\n]/, FORM_DATA_NAME_ESCAPES)
        end

        # Converts a {OnlinePayments::SDK::Communication::RequestHeader} list headers to a hash
        def convert_from_sdk_headers(headers)
          headers.to_h { |h| [h.name, h.value] }
        end

        # Converts the headers of a Net::HTTP response to a {OnlinePayments::SDK::Communication::ResponseHeader} list
        def convert_to_sdk_response_headers(response)
          response.each_capitalized.map { |name, value| ResponseHeader.new(name, value) }
        end

        def log_request(request_id, method, uri, args = {})
          logger = @communicator_logger
          return unless logger

          headers = args[:headers]
          body = args[:body]
          content_type = args[:content_type]
          log_msg_builder = OnlinePayments::SDK::Logging::RequestLogMessageBuilder.new(request_id, method, uri,
                                                                                       @body_obfuscator,
                                                                                       @header_obfuscator)
          headers&.each { |k, v| log_msg_builder.add_headers(k, v) }

          if binary?(headers)
            log_msg_builder.set_body('<binary content>', content_type)
          else
            log_msg_builder.set_body(body, content_type)
          end

          begin
            logger.log(log_msg_builder.message)
          rescue StandardError => e
            logger.log("An error occurred trying to log request #{request_id}", e)
          end
        end

        # Creates the log_response stream
        # both based on whether or not it is binary and on the rest of the response
        def log_response(request_id, status_code, start_time, args = {})
          logger = @communicator_logger
          return unless logger

          duration = (Time.now - start_time) * 1000 # in milliseconds
          headers = args[:headers]
          body = args[:body] unless args[:body].nil?
          content_type = args[:content_type]

          log_msg_builder = OnlinePayments::SDK::Logging::ResponseLogMessageBuilder.new(request_id, status_code, duration,
                                                                                        @body_obfuscator,
                                                                                        @header_obfuscator)
          unless headers.nil?
            headers = convert_from_sdk_headers(headers)
            headers.each do |key, value|
              log_msg_builder.add_headers(key, value)
            end
          end

          if binary_content_type?(content_type)
            log_msg_builder.set_body('<binary content>', content_type)
          else
            log_msg_builder.set_body(body, content_type)
          end

          begin
            logger.log(log_msg_builder.message)
          rescue StandardError => e
            logger.log("An error occurred trying to log response #{request_id}", e)
          end
        end

        def log_error(request_id, start_time, thrown)
          logger = @communicator_logger
          return unless logger

          duration = (Time.now - start_time) * 1000 # in millisecs
          logger.log("Error occurred for outgoing request (requestId='#{request_id}', #{duration} ms)", thrown)
        end

        # @param headers [Hash]
        def binary?(headers)
          return false if headers.nil?

          content_type = nil
          headers.each { |k, v| content_type = v if k.casecmp(CONTENT_TYPE).zero? }
          binary_content_type?(content_type)
        end

        # @param content_type [String, nil]
        def binary_content_type?(content_type)
          unless content_type.nil?
            content_type = content_type.downcase
            return !content_type.start_with?('text/') &&
                   !content_type.include?('json') &&
                   !content_type.include?('xml')
          end
          false
        end
      end
    end
  end
end
