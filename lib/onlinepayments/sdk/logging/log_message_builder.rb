module OnlinePayments::SDK
  module Logging

    # Abstract class used to construct a message describing a request or response.
    #
    # @attr_reader [String] request_id   An identifier assigned to the request and response
    # @attr_reader [String] headers      Request or response headers in string form
    # @attr_reader [String] body         Request or response body as a string
    # @attr_reader [String] content_type Content type of the body, generally 'application/json' or 'text/html'
    class LogMessageBuilder

      attr_reader :request_id
      attr_reader :headers
      attr_reader :body
      attr_reader :content_type

      # Create a new LogMessageBuilder
      def initialize(request_id)
        raise ArgumentError if request_id.nil? || request_id.empty?
        @request_id = request_id
        @headers = ''
      end

      # Adds a single header to the #headers string
      def add_headers(name, value)
        @headers += ', ' unless @headers.empty?
        @headers += "#{name}='#{LoggingUtil.obfuscate_header(name, value)}'"
      end

      # Sets the body of this message to the parameter body.

      # @param body         [String] the message body
      # @param content_type [String] the content type of the body
      def set_body(body, content_type)
        @body = LoggingUtil.obfuscate_body(body)
        @content_type = content_type
      end

      # Constructs and returns the log message as a string.
      def get_message
        raise NotImplementedError, "#{self.class.name}#get_message() is not implemented."
      end

      def to_s
        self.class == LogMessageBuilder ?
          super.to_s :
          get_message
      end

      # Returns an empty string if the parameter is nil, and returns the parameter itself otherwise
      protected def empty_if_null(value)
        value.nil? ? '' : value
      end
    end
  end
end
