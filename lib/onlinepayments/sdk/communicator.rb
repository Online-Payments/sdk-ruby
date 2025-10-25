require 'date'
require 'uri'
require 'onlinepayments/sdk/communication/communication_exception'
require 'onlinepayments/sdk/communication/multipart_form_data_object'
require 'onlinepayments/sdk/communication/multipart_form_data_request'
require 'onlinepayments/sdk/communication/not_found_exception'
require 'onlinepayments/sdk/communication/pooled_connection'
require 'onlinepayments/sdk/communication/request_header'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/communication/response_header'
require 'onlinepayments/sdk/logging/logging_capable'
require 'onlinepayments/sdk/logging/obfuscation/obfuscation_capable'

module OnlinePayments
  module SDK
    # Class responsible for facilitating communication with the Online Payments platform.
    # It combines the following classes to provide communication functionality:
    #
    # api_endpoint::       the base URL to the Online Payments platform
    # connection::         {OnlinePayments::SDK::Communication::Connection} used to communicate with the Online Payments platform
    # authenticator::      {OnlinePayments::SDK::Authentication::Authenticator} used for authenticating messages sent
    # metadata_provider::  {OnlinePayments::SDK::Communication::MetadataProvider} object containing information relevant for sending requests
    # marshaller::         {OnlinePayments::SDK::JSON::Marshaller} that is used to marshal and unmarshal data to and from JSON format
    #
    # @attr_reader [OnlinePayments::SDK::JSON::Marshaller] marshaller A Marshaller instance used by the communicator for serializing/deserializing to/from JSON
    #
    class Communicator
      include Logging::LoggingCapable
      include Logging::Obfuscation::ObfuscationCapable

      # Creates a new Communicator.
      #
      # @param api_endpoint      [String] the base URL to the Online Payments platform
      # @param connection        [OnlinePayments::SDK::Communication::Connection] used to communicate with the Online Payments platform
      # @param authenticator     [OnlinePayments::SDK::Authentication::Authenticator] used for authenticating messages sent
      # @param metadata_provider [OnlinePayments::SDK::Communication::MetadataProvider] object containing information relevant for sending requests
      # @param marshaller        [OnlinePayments::SDK::JSON::Marshaller] used to marshal and unmarshal data to and from JSON format
      #
      def initialize(api_endpoint, connection, authenticator, metadata_provider, marshaller)
        raise ArgumentError.new('api_endpoint is required') unless api_endpoint
        raise ArgumentError.new('connection is required') unless connection
        raise ArgumentError.new('authenticator is required') unless authenticator
        raise ArgumentError.new('metadata_provider is required') unless metadata_provider
        raise ArgumentError('marshaller is required') if marshaller.nil?

        uri = URI(api_endpoint)
        raise RuntimeError, 'api_endpoint should not contain a path' unless uri.path.nil? || uri.path.empty?
        unless uri.userinfo.nil? && uri.query.nil? && uri.fragment.nil?
          raise RuntimeError, 'api_endpoint should not contain user info, query or fragment'
        end
        @api_endpoint = uri
        @connection = connection
        @authenticator = authenticator
        @metadata_provider = metadata_provider
        @marshaller = marshaller
      end

      # Performs a GET request to the Online Payments platform and returns the response as the given response type.
      #
      # @param relative_path      [String] path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] optional request parameters
      # @param response_type      [Type] the response type.
      # @param context            [OnlinePayments::SDK::CallContext, nil] optional call context.
      # @return the response of the GET request as the given response type
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def get(relative_path, request_headers, request_parameters, response_type, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)

        request_headers = [] if request_headers.nil?
        add_generic_headers('GET', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.get(uri, request_headers) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = content.read.force_encoding('UTF-8')
        end
        process_response(response_body, response_status_code, response_headers, response_type, relative_path, context)
      end

      # Performs a GET request to the Online Payments platform and yields the response as the headers and body.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @yield [Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO] The response headers and body.
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def get_with_binary_response(relative_path, request_headers, request_parameters, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)

        request_headers = [] if request_headers.nil?
        add_generic_headers('GET', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.get(uri, request_headers) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = process_binary_response(status_code, content, headers, context) do |h, c|
            yield h, c
          end
        end
        throw_exception_if_necessary(response_body, response_status_code, response_headers, relative_path)
      end

      # Performs a DELETE request to the Online Payments platform and returns the response as the given response type.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param response_type      [Type] The response type.
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @return The response of the DELETE request as the given response type
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def delete(relative_path, request_headers, request_parameters, response_type, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)
        request_headers = [] if request_headers.nil?
        add_generic_headers('DELETE', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.delete(uri, request_headers) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = content.read.force_encoding('UTF-8')
        end
        process_response(response_body, response_status_code, response_headers, response_type, relative_path, context)
      end

      # Performs a DELETE request to the Online Payments platform and yields the response as the headers and body.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @yield [Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO] The response headers and body.
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def delete_with_binary_response(relative_path, request_headers, request_parameters, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)
        request_headers = [] if request_headers.nil?
        add_generic_headers('DELETE', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.delete(uri, request_headers) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = process_binary_response(status_code, content, headers, context) do |h, c|
            yield h, c
          end
        end
        throw_exception_if_necessary(response_body, response_status_code, response_headers, relative_path)
      end

      # Performs a POST request to the Online Payments platform and returns the response as the given response type.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param request_body       [OnlinePayments::SDK::Domain::DataObject, OnlinePayments::SDK::Communication::MultipartFormDataObject, OnlinePayments::SDK::Communication::MultipartFormDataRequest, nil]
      #                           The optional request body
      # @param response_type      [Type] The response type.
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @return The response of the POST request as the given response type
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def post(relative_path, request_headers, request_parameters, request_body, response_type, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)
        request_headers = [] if request_headers.nil?

        body = nil
        if request_body.is_a? Communication::MultipartFormDataObject
          request_headers.push(Communication::RequestHeader.new('Content-Type', request_body.content_type))
          body = request_body
        elsif request_body.is_a? Communication::MultipartFormDataRequest
          multipart = request_body.to_multipart_form_data_object
          request_headers.push(Communication::RequestHeader.new('Content-Type', multipart.content_type))
          body = multipart
        elsif !request_body.nil?
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'application/json'))
          body = @marshaller.marshal(request_body)
        else
          # Set the content-type, even though there is no body, to prevent the httpClient from
          # adding a content-type header after authentication has been generated.
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'text/plain'))
        end

        add_generic_headers('POST', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.post(uri, request_headers, body) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = content.read.force_encoding('UTF-8')
        end
        process_response(response_body, response_status_code, response_headers, response_type, relative_path, context)
      end

      # Performs a POST request to the Online Payments platform and yields the response as the headers and body.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param request_body       [OnlinePayments::SDK::Domain::DataObject, OnlinePayments::SDK::Communication::MultipartFormDataObject, OnlinePayments::SDK::Communication::MultipartFormDataRequest, nil]
      #                           The optional request body
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @yield [Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO] The response headers and body.
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def post_with_binary_response(relative_path, request_headers, request_parameters, request_body, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)
        request_headers = [] if request_headers.nil?

        body = nil
        if request_body.is_a? Communication::MultipartFormDataObject
          request_headers.push(Communication::RequestHeader.new('Content-Type', request_body.content_type))
          body = request_body
        elsif request_body.is_a? Communication::MultipartFormDataRequest
          multipart = request_body.to_multipart_form_data_object
          request_headers.push(Communication::RequestHeader.new('Content-Type', multipart.content_type))
          body = multipart
        elsif !request_body.nil?
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'application/json'))
          body = @marshaller.marshal(request_body)
        else
          # Set the content-type, even though there is no body, to prevent the httpClient from
          # adding a content-type header after authentication has been generated.
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'text/plain'))
        end
        add_generic_headers('POST', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.post(uri, request_headers, body) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = process_binary_response(status_code, content, headers, context) do |h, c|
            yield h, c
          end
        end
        throw_exception_if_necessary(response_body, response_status_code, response_headers, relative_path)
      end

      # Performs a PUT request to the Online Payments platform and returns the response as the given response type.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param request_body       [OnlinePayments::SDK::Domain::DataObject, OnlinePayments::SDK::Communication::MultipartFormDataObject, OnlinePayments::SDK::Communication::MultipartFormDataRequest, nil]
      #                           The optional request body
      # @param response_type      [Type] The response type.
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @return The response of the PUT request as the given response type
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def put(relative_path, request_headers, request_parameters, request_body, response_type, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)
        request_headers = [] if request_headers.nil?

        body = nil
        if request_body.is_a? Communication::MultipartFormDataObject
          request_headers.push(Communication::RequestHeader.new('Content-Type', request_body.content_type))
          body = request_body
        elsif request_body.is_a? Communication::MultipartFormDataRequest
          multipart = request_body.to_multipart_form_data_object
          request_headers.push(Communication::RequestHeader.new('Content-Type', multipart.content_type))
          body = multipart
        elsif !request_body.nil?
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'application/json'))
          body = @marshaller.marshal(request_body)
        else
          # Set the content-type, even though there is no body, to prevent the httpClient from
          # adding a content-type header after authentication has been generated.
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'text/plain'))
        end
        add_generic_headers('PUT', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.put(uri, request_headers, body) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = content.read.force_encoding('UTF-8')
        end
        process_response(response_body, response_status_code, response_headers, response_type, relative_path, context)
      end

      # Performs a PUT request to the Online Payments platform and yields the response as the headers and body.
      #
      # @param relative_path      [String] Path relative to the API endpoint
      # @param request_headers    [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] Optional array of request headers
      # @param request_parameters [OnlinePayments::SDK::Communication::ParamRequest, nil] Optional request parameters
      # @param request_body       [OnlinePayments::SDK::Domain::DataObject, OnlinePayments::SDK::Communication::MultipartFormDataObject, OnlinePayments::SDK::Communication::MultipartFormDataRequest, nil]
      #                           The optional request body
      # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
      # @yield [Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO] The response headers and body.
      # @raise [OnlinePayments::SDK::Communication::ResponseException] if the request could not be fulfilled successfully.
      #        This occurs for example if the request is not authenticated correctly
      # @raise [OnlinePayments::SDK::Communication::NotFoundException] if the requested resource is not found
      # @raise [OnlinePayments::SDK::Communication::CommunicationException] if there is an error in communicating with the Online Payments platform.
      #        This occurs for example if a timeout occurs.
      def put_with_binary_response(relative_path, request_headers, request_parameters, request_body, context)
        request_parameter_list = request_parameters && request_parameters.to_request_parameters
        uri = to_absolute_uri(relative_path, request_parameter_list)
        request_headers = [] if request_headers.nil?

        body = nil
        if request_body.is_a? Communication::MultipartFormDataObject
          request_headers.push(Communication::RequestHeader.new('Content-Type', request_body.content_type))
          body = request_body
        elsif request_body.is_a? Communication::MultipartFormDataRequest
          multipart = request_body.to_multipart_form_data_object
          request_headers.push(Communication::RequestHeader.new('Content-Type', multipart.content_type))
          body = multipart
        elsif !request_body.nil?
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'application/json'))
          body = @marshaller.marshal(request_body)
        else
          # Set the content-type, even though there is no body, to prevent the httpClient from
          # adding a content-type header after authentication has been generated.
          request_headers.push(Communication::RequestHeader.new('Content-Type', 'text/plain'))
        end
        add_generic_headers('PUT', uri, request_headers, context)

        response_status_code, response_headers, response_body = nil
        @connection.put(uri, request_headers, body) do |status_code, headers, content|
          response_status_code = status_code
          response_headers = headers
          response_body = process_binary_response(status_code, content, headers, context) do |h, c|
            yield h, c
          end
        end
        throw_exception_if_necessary(response_body, response_status_code, response_headers, relative_path)
      end

      # Closes any connections idle for more than _idle_time_ seconds.
      # Will not have any effect if the connection is not a pooled connection (an instance of {OnlinePayments::SDK::Communication::PooledConnection}).
      def close_idle_connections(idle_time)
        @connection.close_idle_connections(idle_time) if @connection.is_a? PooledConnection
      end

      # Closes any connections that have expired.
      # Will not have any effect if the connection is not a pooled connection (an instance of {OnlinePayments::SDK::Communication::PooledConnection}).
      def close_expired_connections
        @connection.close_expired_connections if @connection.is_a? PooledConnection
      end

      # Sets the current body obfuscator to use.
      # @param body_obfuscator [OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator]
      def set_body_obfuscator(body_obfuscator)
        @connection.set_body_obfuscator(body_obfuscator)
      end

      # Sets the current header obfuscator to use.
      # @param header_obfuscator [OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator]
      def set_header_obfuscator(header_obfuscator)
        @connection.set_header_obfuscator(header_obfuscator)
      end

      # Enables logging outgoing requests and incoming responses by registering the _communicator_logger_.
      # Note that only one logger can be registered at a time and calling _enable_logging_
      # a second time will override the old logger instance with the new one.
      #
      # @param communicator_logger [OnlinePayments::SDK::Logging::CommunicatorLogger] The communicator logger the requests and responses are logged to
      def enable_logging(communicator_logger)
        @connection.enable_logging(communicator_logger)
      end

      # Disables logging by unregistering any previous logger that might be registered.
      def disable_logging
        @connection.disable_logging
      end

      # Frees networking resources by closing the underlying network connections.
      # After calling _close_, any use of the _get_, _delete_, _post_ and _put_ methods will not function
      # and likely result in an error.
      def close
        @connection.close
      end

      attr_reader :marshaller

      protected

      # Constructs a full URL using the base URL and the given relative path and request_parameters.
      # The returned URL is a *URI* object.
      #
      # @param relative_path      [String] The relative path of the URL.
      # @param request_parameters [Array<OnlinePayments::SDK::Communication::RequestParam>] A list of request parameters that each have #name and #value
      #                           which represent the parameter name and value respectively.
      def to_absolute_uri(relative_path, request_parameters)
        absolute_path = relative_path.start_with?('/') ? relative_path : '/' + relative_path
        uri = URI::HTTP.new(@api_endpoint.scheme, nil, @api_endpoint.host,
                            @api_endpoint.port, nil, absolute_path, nil, nil, nil)
        unless request_parameters.nil?
          request_parameters.each do |nvp|
            parameters = URI.decode_www_form(uri.query || '') << [nvp.name, nvp.value]
            uri.query = URI.encode_www_form(parameters)
          end
        end
        uri
      end

      # Adds several standard headers to the http headers.
      # This method will add the 'Date' and 'Authorization' header;
      # the 'X-GCS-Idempotence-Key' header will also be added if an idempotence context is given
      #
      # @param http_method     [String] 'GET', 'DELETE', 'POST' or 'PUT' depending on the HTTP method being used
      # @param uri             [URI::HTTP] The full URI to the Online Payments platform,
      #                        including the relative path and request parameters.
      # @param request_headers [Array<OnlinePayments::SDK::Communication::RequestHeader>] List of request headers in which which new headers will be added
      # @param context         [OnlinePayments::SDK::CallContext, nil] optional call context.
      def add_generic_headers(http_method, uri, request_headers, context = nil)
        request_headers.concat(@metadata_provider.metadata_headers)
        request_headers.push(Communication::RequestHeader.new('Date', get_header_date_string))
        if !context.nil? && !context.idempotence_key.nil?
          request_headers.push(Communication::RequestHeader.new('X-GCS-Idempotence-Key', context.idempotence_key))
        end
        authorization = @authenticator.get_authorization(http_method, uri, request_headers)
        request_headers.push(Communication::RequestHeader.new('Authorization', authorization))
      end

      def get_header_date_string
        Time.now.utc.strftime('%a, %d %b %Y %H:%M:%S GMT')
      end

      def process_response(body, status, headers, response_type, request_path, context)
        update_context(headers, context) unless context.nil?

        throw_exception_if_necessary(body, status, headers, request_path)
        @marshaller.unmarshal(body, response_type)
      end

      def process_binary_response(status, body, headers, context)
        update_context(response.headers, context) unless context.nil?

        if status < 400
          yield headers, body
          ''
        else
          body.read.force_encoding('UTF-8')
        end
      end

      def update_context(headers, context)
        idempotence_request_timestamp_value = Communication::ResponseHeader.get_header_value(headers, 'X-GCS-Idempotence-Request-Timestamp')
        if idempotence_request_timestamp_value.nil?
          context.idempotence_request_timestamp = nil
        else
          context.idempotence_request_timestamp = idempotence_request_timestamp_value
        end
        idempotence_response_date_time_value = Communication::ResponseHeader.get_header_value(headers, 'IdempotencyResponseDatetime')
        if idempotence_response_date_time_value.nil?
          context.idempotence_response_date_time = nil
        else
          context.idempotence_response_date_time = DateTime.parse(idempotence_response_date_time_value)
        end
      end

      def throw_exception_if_necessary(body, status_code, headers, request_path)
        if status_code < 200 || status_code >= 300
          if !body.nil? && !is_json(headers)
            cause = Communication::ResponseException.new(status_code, headers, body)
            if status_code == 404
              raise Communication::NotFoundException.new(cause, 'The requested resource was not found; invalid path: ' +
                request_path)
            else
              raise Communication::CommunicationException, cause
            end
          else
            raise Communication::ResponseException.new(status_code, headers, body)
          end
        end
      end

      private

      def is_json(headers)
        content_type = Communication::ResponseHeader.get_header_value(headers, 'Content-Type')
        if content_type.nil? || 'application/json'.casecmp(content_type) == 0 || 'application/problem+json'.casecmp(content_type) == 0
          return true
        end
        content_type = content_type.downcase
        content_type.start_with?('application/json') || content_type.start_with?('application/problem+json')
      end
    end
  end
end
