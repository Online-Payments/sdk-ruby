module OnlinePayments::SDK

  # Represents HTTP response headers
  # Each header is immutable has a #name and #value attribute
  #
  # @attr_reader [String] name  HTTP header name
  # @attr_reader [String] value HTTP header value
  class ResponseHeader

    # Create a new header using the name and value given as parameters.
    def initialize(name, value)
      raise ArgumentError, 'name is required' if name.nil? || name.strip.empty?
      @name = name
      @value = value
    end

    attr_reader :name
    attr_reader :value

    def to_s
      "#{name}:#{value}"
    end

    # Return the {OnlinePayments::SDK::ResponseHeader} that goes by the given _header_name_,
    # If this Response does not contain a header with the given name, return _nil_ instead
    def self.get_header(headers, header_name)
      selected_headers = headers.select { |h| h.name.casecmp(header_name) == 0 }
      if selected_headers.nil? || selected_headers.length == 0
        return nil
      else
        return selected_headers[0]
      end
    end

    # Returns the header value of the header that goes by the given _header_name_,
    # If this response does not contain a header with the given name, return _nil_ instead
    def self.get_header_value(headers, header_name)
      header = get_header(headers, header_name)
      return header&.value
    end
  end
end
