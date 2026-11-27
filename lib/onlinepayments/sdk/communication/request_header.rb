# frozen_string_literal: true

module OnlinePayments
  module SDK
    module Communication
      # Represents HTTP request headers
      # Each header is immutable has a #name and #value attribute
      #
      # @attr_reader [String] name  HTTP header name
      # @attr_reader [String] value HTTP header value
      class RequestHeader
        # Create a new header using the name and value given as parameters.
        def initialize(name, value)
          raise ArgumentError, 'name is required' if name.nil? || name.strip.empty?

          @name = name
          @value = normalize_value(value)
        end

        attr_reader :name, :value

        def to_s
          "#{name}:#{value}"
        end

        # Return the {OnlinePayments::SDK::Communication::RequestHeader} that goes by the given _header_name_,
        # If this Response does not contain a header with the given name, return _nil_ instead
        def self.get_header(headers, header_name)
          selected_headers = headers.select { |h| h.name == header_name }
          return nil if selected_headers.nil? || selected_headers.empty?

          selected_headers[0]
        end

        # Returns the header value of the header that goes by the given _header_name_,
        # If this response does not contain a header with the given name, return _nil_ instead
        def self.get_header_value(headers, header_name)
          header = get_header(headers, header_name)
          (
            if header.nil?
              nil
            else
              header.value
            end)
        end

        private

        def normalize_value(value)
          return value if value.nil? || value.empty?

          # Replace all sequences of linebreak-whitespace* with a single linebreak-space
          value.gsub(/\r?\n[\s&&[^\r\n]]*/, ' ')
        end
      end
    end
  end
end
