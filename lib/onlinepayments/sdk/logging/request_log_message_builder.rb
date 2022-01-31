module OnlinePayments::SDK
  module Logging

    # Class that converts data about a request into a properly formatted log message.
    # Formats request id, http method, uri, headers and body into a helpful message.
    class RequestLogMessageBuilder < OnlinePayments::SDK::Logging::LogMessageBuilder

      def initialize(request_id, method, uri)
        super(request_id)
        @method = method
        @uri = uri
      end

      # Constructs and returns a log message based on the request data. The log message is a string.
      def get_message
        @body ?
          sprintf(MSG_TEMPLATE_WITH_BODY, @request_id, empty_if_null(@method),
                  format_uri, @headers, empty_if_null(@content_type), @body) :
          sprintf(MSG_TEMPLATE_WITHOUT_BODY, @request_id, empty_if_null(@method), format_uri, @headers)
      end

      private

      MSG_TEMPLATE_WITHOUT_BODY = "Outgoing request (requestId=\"%s\"):\n"\
                                  "  method:       \"%s\"\n"\
                                  "  uri:          \"%s\"\n"\
                                  "  headers:      \"%s\"".freeze
      MSG_TEMPLATE_WITH_BODY = "#{MSG_TEMPLATE_WITHOUT_BODY}\n"\
                               "  content-type: \"%s\"\n"\
                               "  body:         \"%s\"".freeze

      def format_uri
        return '' unless @uri && @uri.path
        return @uri.path unless @uri.query
        "#{@uri.path}?#{@uri.query}"
      end
    end
  end
end
