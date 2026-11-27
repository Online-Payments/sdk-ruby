# frozen_string_literal: true

require 'onlinepayments/sdk/logging/obfuscation/body_obfuscator'
require 'onlinepayments/sdk/logging/obfuscation/header_obfuscator'

module OnlinePayments
  module SDK
    module Logging
      # Abstract class used to construct a message describing a request or response.
      #
      # @attr_reader [String] request_id   An identifier assigned to the request and response
      # @attr_reader [String] headers      Request or response headers in string form
      # @attr_reader [String] body         Request or response body as a string
      # @attr_reader [String] content_type Content type of the body, generally 'application/json' or 'text/html'
      # @attr_reader [OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator] body_obfuscator
      # @attr_reader [OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator] header_obfuscator
      class LogMessageBuilder
        attr_reader :request_id, :headers, :body, :content_type, :body_obfuscator, :header_obfuscator

        # Create a new LogMessageBuilder
        def initialize(request_id,
                       body_obfuscator = Obfuscation::BodyObfuscator.default_obfuscator,
                       header_obfuscator = Obfuscation::HeaderObfuscator.default_obfuscator)
          raise ArgumentError if request_id.nil? || request_id.empty?
          raise ArgumentError if body_obfuscator.nil?
          raise ArgumentError if header_obfuscator.nil?

          @request_id = request_id
          @headers = ''
          @body_obfuscator = body_obfuscator
          @header_obfuscator = header_obfuscator
        end

        # Adds a single header to the #headers string
        def add_headers(name, value)
          @headers += ', ' unless @headers.empty?
          @headers += "#{name}=\""
          @headers += @header_obfuscator.obfuscate_header(name, value) unless value.nil?
          @headers += '"'
        end

        # Sets the body of this message to the parameter body.

        # @param body         [String] the message body
        # @param content_type [String] the content type of the body
        def set_body(body, content_type)
          @body = if binary?(content_type)
                    '<binary content>'
                  else
                    @body_obfuscator.obfuscate_body(body)
                  end
          @content_type = content_type
        end

        # Constructs and returns the log message as a string.
        # @return [String]
        def message
          raise NotImplementedError, "#{self.class.name}#message() is not implemented."
        end

        # @deprecated Use {#message} instead.
        # @return [String]
        def get_message # rubocop:disable Naming/AccessorMethodName
          message
        end

        def to_s
          if instance_of?(LogMessageBuilder)
            super.to_s
          else
            message
          end
        end

        protected

        # Returns an empty string if the parameter is nil, and returns the parameter itself otherwise
        def empty_if_null(value)
          value.nil? ? '' : value
        end

        private

        # Returns whether or not the content type is binary
        def binary?(content_type)
          if content_type.nil?
            false
          else
            content_type = content_type.downcase
            !(content_type.start_with?('text/') || content_type.include?('json') || content_type.include?('xml'))
          end
        end
      end
    end
  end
end
