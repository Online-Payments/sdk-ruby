# frozen_string_literal: true

module OnlinePayments
  module SDK
    module Communication
      # Represents a URL request parameter.
      # Each parameter is immutable and has a #name and #value attribute.
      #
      # @attr_reader [String] name  Parameter name
      # @attr_reader [String] value Parameter value
      class RequestParam
        def initialize(name, value)
          raise ArgumentError, 'name is required' if name.nil? || name.strip.empty?

          @name = name
          @value = value
        end

        attr_reader :name, :value

        def to_s
          "#{name}=#{value}"
        end
      end
    end
  end
end
