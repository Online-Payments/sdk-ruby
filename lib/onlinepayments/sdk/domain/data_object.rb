# frozen_string_literal: true

require 'json'
require 'onlinepayments/sdk/logging/obfuscation/body_obfuscator'

module OnlinePayments
  module SDK
    module Domain
      # Base class for all SDK data objects, supports marshalling and unmarshalling the data object to and from JSON.
      class DataObject
        # Returns a hash representation of the DataObject.
        # The hash contains camelCase representations of the variables, and their values.
        # Should be overridden to add all instance variables of the object.
        #
        # @return [Hash]
        def to_h
          {}
        end

        # Create a new instance of this object (DataObject or descendant)
        # from a hash containing attribute values in camelCase.
        # Note that the hash contains Strings as keys instead of more commonly used tokens.
        def self.new_from_hash(hash)
          obj = new
          obj.from_hash(hash)
          obj
        end

        # Set attributes from values in parameter hash.
        # Should be overridden by descendants in order to properly restore their attributes from the hash.
        # Note that the hash contains Strings as keys instead of more commonly used tokens.
        def from_hash(hash) end

        # Returns the class name and the attributes that have a value, as JSON.
        # Sensitive values are masked with the same rules as the SDK's log messages.
        #
        # @return [String]
        def inspect
          body = OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator.default_obfuscator.obfuscate_body(::JSON.generate(to_h))
          "#<#{self.class.name} #{body}>"
        rescue StandardError
          "#<#{self.class.name}>"
        end

        alias to_s inspect
      end
    end
  end
end
