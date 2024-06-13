require 'uri'
require 'onlinepayments/sdk/multipart_form_data_object'
require 'onlinepayments/sdk/multipart_form_data_request'

module OnlinePayments::SDK
  # Class responsible for facilitating communication with the Online Payments platform.
  # It combines the following classes to provide communication functionality:
  #
  # api_endpoint::       The base URI ({URI::HTTP}) to the Online Payments platform
  # connection::         {OnlinePayments::SDK::Connection} used to communicate with the Online Payments platform
  # authenticator::      {OnlinePayments::SDK::Authenticator} used for authenticating messages sent
  # meta_data_provider:: {OnlinePayments::SDK::MetaDataProvider} object containing information relevant for sending requests
  # marshaller::         {OnlinePayments::SDK::Marshaller} that is used to marshal and unmarshal data to and from JSON format
  #
  # @attr_reader [OnlinePayments::SDK::Marshaller] marshaller A Marshaller instance used by the communicator for serializing/deserializing to/from JSON
  #
  class Communicator
    include Logging::LoggingCapable

    # Creates a new Communicator based on the given arguments.
    #
    # @param api_endpoint       [String] the base URL to the Online Payments platform
    # @param connection         [OnlinePayments::SDK::Connection] used to communicate with the Online Payments platform
    # @param authenticator      [OnlinePayments::SDK::Authenticator] used for authenticating messages sent
    # @param meta_data_provider [OnlinePayments::SDK::MetaDataProvider] object containing information relevant for sending requests
    # @param marshaller [OnlinePayments::SDK::Marshaller] used to marshal and unmarshal data to and from JSON format
    #
    def initialize(api_endpoint, connection, authenticator, meta_data_provider, marshaller)
      raise ArgumentError, 'api_endpoint is required' unless api_endpoint
      raise ArgumentError, 'connection is required' unless connection
      raise ArgumentError, 'authenticator is required' unless authenticator
      raise ArgumentError, 'meta_data_provider is required' unless meta_data_provider
      raise ArgumentError('marshaller is required') unless marshaller

      @api_endpoint = URI(api_endpoint)
      if @api_endpoint.path.length.positive? || @api_endpoint.query || @api_endpoint.fragment
        raise ArgumentError, "Base URL should not contain a path, query or fragment #{@api_endpoint}"
      end
      @connection = connection
      @authenticator = authenticator
      @meta_data_provider = meta_data_provider
      @marshaller = marshaller
    end

    # Performs a GET request to the Online Payments platform and returns the response as the given response type.
    #
    # @param relative_path      [String] path relative to the API endpoint
    # @param request_headers    [Array<OnlinePayments::SDK::RequestHeader>, nil] optional array of request headers
    # @param request_parameters [OnlinePayments::SDK::ParamRequest, nil] optional request parameters
    # @param response_type      [Type] the response type.
    # @param context            [OnlinePayments::SDK::CallContext, nil] optional call context.
    # @return the response of the GET request as the given response type
    # @raise [OnlinePayments::SDK::ResponseException] if the request could not be fulfilled successfully.
    #        This occurs for example if the request is not authenticated correctly
    # @raise [OnlinePayments::SDK::NotFoundException] if the requested resource is not found
    # @raise [OnlinePayments::SDK::CommunicationException] if there is an error in communicating with the Online Payments platform.
    #        This occurs for example if a timeout occurs.
    def get(relative_path, request_headers, request_parameters, response_type, context)
      connection = @connection
      request_parameter_list = request_parameters&.to_request_parameters
      uri = to_absolute_uri(relative_path, request_parameter_list)

      request_headers ||= []
      add_generic_headers('GET', uri, request_headers, context)

      response_status_code, response_headers, response_body = nil
      connection.get(uri, request_headers) do |status_code, headers, content|
        response_status_code = status_code
        response_headers = headers
        response_body = content.read.force_encoding('UTF-8')
      end
      process_response(response_body, response_status_code, response_headers, response_type, relative_path, context)
    end

    # Performs a DELETE request to the Online Payments platform and returns the response as the given response type.
    #
    # @param relative_path      [String] Path relative to the API endpoint
    # @param request_headers    [Array<OnlinePayments::SDK::RequestHeader>, nil] Optional array of request headers
    # @param request_parameters [OnlinePayments::SDK::ParamRequest, nil] Optional request parameters
    # @param response_type      [Type] The response type.
    # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
    # @return The response of the DELETE request as the given response type
    # @raise [OnlinePayments::SDK::ResponseException] if the request could not be fulfilled successfully.
    #        This occurs for example if the request is not authenticated correctly
    # @raise [OnlinePayments::SDK::NotFoundException] if the requested resource is not found
    # @raise [OnlinePayments::SDK::CommunicationException] if there is an error in communicating with the Online Payments platform.
    #        This occurs for example if a timeout occurs.
    def delete(relative_path, request_headers, request_parameters, response_type, context)
      connection = @connection
      request_parameter_list = request_parameters&.to_request_parameters
      uri = to_absolute_uri(relative_path, request_parameter_list)
      request_headers ||= []
      add_generic_headers('DELETE', uri, request_headers, context)

      response_status_code, response_headers, response_body = nil
      connection.delete(uri, request_headers) do |status_code, headers, content|
        response_status_code = status_code
        response_headers = headers
        response_body = content.read.force_encoding('UTF-8')
      end
      process_response(response_body, response_status_code, response_headers, response_type, relative_path, context)
    end

    # Performs a POST request to the Online Payments platform and returns the response as the given response type.
    #
    # @param relative_path      [String] Path relative to the API endpoint
    # @param request_headers    [Array<OnlinePayments::SDK::RequestHeader>, nil] Optional array of request headers
    # @param request_parameters [OnlinePayments::SDK::ParamRequest, nil] Optional request parameters
    # @param request_body       [OnlinePayments::SDK::DataObject, OnlinePayments::SDK::MultipartFormDataObject, OnlinePayments::SDK::MultipartFormDataRequest] 
    #                           The optional request body
    # @param response_type      [Type] The response type.
    # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
    # @return The response of the POST request as the given response type
    # @raise [OnlinePayments::SDK::ResponseException] if the request could not be fulfilled successfully.
    #        This occurs for example if the request is not authenticated correctly
    # @raise [OnlinePayments::SDK::NotFoundException] if the requested resource is not found
    # @raise [OnlinePayments::SDK::CommunicationException] if there is an error in communicating with the Online Payments platform.
    #        This occurs for example if a timeout occurs.
    def post(relative_path, request_headers, request_parameters, request_body, response_type, context)
      request_parameter_list = request_parameters&.to_request_parameters
      uri = to_absolute_uri(relative_path, request_parameter_list)
      request_headers ||= []

      body = nil
      if request_body.is_a? MultipartFormDataObject
        request_headers.push(RequestHeader.new('Content-Type', request_body.content_type))
        body = request_body
      elsif request_body.is_a? MultipartFormDataRequest
        multipart = request_body.to_multipart_form_data_object
        request_headers.push(RequestHeader.new('Content-Type', multipart.content_type))
        body = multipart
      elsif request_body
        request_headers.push(RequestHeader.new('Content-Type', 'application/json'))
        body = @marshaller.marshal(request_body)
      else
        # Set the content-type, even though there is no body, to prevent the httpClient from
        # adding a content-type header after authentication has been generated.
        request_headers.push(RequestHeader.new('Content-Type', 'text/plain'))
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

    # Performs a PUT request to the Online Payments platform and returns the response as the given response type.
    #
    # @param relative_path      [String] Path relative to the API endpoint
    # @param request_headers    [Array<OnlinePayments::SDK::RequestHeader>, nil] Optional array of request headers
    # @param request_parameters [OnlinePayments::SDK::ParamRequest, nil] Optional request parameters
    # @param request_body       [OnlinePayments::SDK::DataObject]
    #                           The optional request body
    # @param response_type      [Type] The response type.
    # @param context            [OnlinePayments::SDK::CallContext, nil] Optional call context.
    # @return The response of the PUT request as the given response type
    # @raise [OnlinePayments::SDK::ResponseException] if the request could not be fulfilled successfully.
    #        This occurs for example if the request is not authenticated correctly
    # @raise [OnlinePayments::SDK::NotFoundException] if the requested resource is not found
    # @raise [OnlinePayments::SDK::CommunicationException] if there is an error in communicating with the Online Payments platform.
    #        This occurs for example if a timeout occurs.
    def put(relative_path, request_headers, request_parameters, request_body, response_type, context)
      request_parameter_list = request_parameters&.to_request_parameters
      uri = to_absolute_uri(relative_path, request_parameter_list)
      request_headers ||= []

      body = nil
      if request_body
        request_headers.push(RequestHeader.new('Content-Type', 'application/json'))
        body = @marshaller.marshal(request_body)
      else
        # Set the content-type, even though there is no body, to prevent the httpClient from
        # adding a content-type header after authentication has been generated.
        request_headers.push(RequestHeader.new('Content-Type', 'text/plain'))
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

    # Closes any connections idle for more than _idle_time_ seconds.
    # Will not have any effect if the connection is not a pooled connection (an instance of {OnlinePayments::SDK::PooledConnection}).
    def close_idle_connections(idle_time)
      @connection.close_idle_connections(idle_time) if connection.is_a? PooledConnection
    end

    # Closes any connections that have expired.
    # Will not have any effect if the connection is not a pooled connection (an instance of {OnlinePayments::SDK::PooledConnection}).
    def close_expired_connections
      @connection.close_expired_connections if connection.is_a? PooledConnection
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

    attr_reader :api_endpoint
    attr_reader :connection
    attr_reader :authenticator
    attr_reader :meta_data_provider
    attr_reader :marshaller

    protected

    # Constructs a full URL using the base URL and the given relative path and request_parameters.
    # The returned URL is a *URI* object.
    #
    # @param relative_path      [String] The relative path of the URL.
    # @param request_parameters [Array<OnlinePayments::SDK::RequestParam>, nil] A list of request parameters that each have #name and #value
    #                           which represent the parameter name and value respectively.
    def to_absolute_uri(relative_path, request_parameters)
      raise RuntimeError('api_endpoint should not contain a path') unless @api_endpoint.path.nil? || @api_endpoint.path.empty?

      if @api_endpoint.userinfo || @api_endpoint.query || @api_endpoint.fragment
        raise RuntimeError, 'api_endpoint should not contain user info, query or fragment'
      end
      absolute_path = relative_path.start_with?('/') ? relative_path : "/#{relative_path}"
      uri = URI::HTTP.new(@api_endpoint.scheme, nil, @api_endpoint.host,
                          @api_endpoint.port, nil, absolute_path, nil, nil, nil)
      request_parameters&.each do |nvp|
        parameters = URI.decode_www_form(uri.query || '') << [nvp.name, nvp.value]
        uri.query = URI.encode_www_form(parameters)
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
    # @param request_headers [Array<OnlinePayments::SDK::RequestHeader>] List of request headers in which which new headers will be added
    # @param context         [OnlinePayments::SDK::CallContext, nil] object that will be used to produce
    #   an Idempotence header to prevent accidental request duplication.
    def add_generic_headers(http_method, uri, request_headers, context = nil)
      request_headers.concat(meta_data_provider.meta_data_headers)
      request_headers.push(RequestHeader.new('Date', get_header_date_string))
      if context&.idempotence_key
        request_headers.push(RequestHeader.new('X-GCS-Idempotence-Key', context.idempotence_key))
      end
      authentication_signature = @authenticator.create_simple_authentication_signature(http_method, uri, request_headers)
      request_headers.push(RequestHeader.new('Authorization', authentication_signature))
    end

    def get_header_date_string
      Time.now.utc.strftime('%a, %d %b %Y %H:%M:%S GMT')
    end

    def process_response(body, status, headers, response_type, request_path, context)
      update_context(headers, context) if context

      throw_exception_if_necessary(body, status, headers, request_path)
      @marshaller.unmarshal(body, response_type)
    end

    def update_context(headers, context)
      context.idempotence_request_timestamp = ResponseHeader.get_header_value(headers, 'X-GCS-Idempotence-Request-Timestamp')
    end

    def throw_exception_if_necessary(body, status_code, headers, request_path)
      return if status_code >= 200 && status_code < 300
      raise ResponseException.new status_code, headers, body unless body && !is_json(headers)

      cause = ResponseException.new(status_code, headers, body)
      if status_code == 404
        raise NotFoundException, cause, "The requested resource was not found; invalid path: #{request_path}"
      end

      raise CommunicationException, cause
    end

    private

    def is_json(headers)
      content_type = ResponseHeader.get_header_value(headers, 'Content-Type')
      content_type.nil? || 'application/json'.casecmp(content_type).zero? ||
        content_type.downcase.start_with?('application/json')
    end
  end
end
