#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] key
      # @attr [String, nil] must_write_reason
      # @attr [String, nil] status
      # @attr [String, nil] value
      class AccountOnFileAttribute < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :key

        # @deprecated Deprecated
        attr_accessor :must_write_reason

        attr_accessor :status

        attr_accessor :value

        # Sets the property and returns this same instance.
        def with_key(value)
          @key = value
          self
        end

        # Sets the property and returns this same instance.
        def with_must_write_reason(value)
          @must_write_reason = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_value(value)
          @value = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['key'] = @key unless @key.nil?
          hash['mustWriteReason'] = @must_write_reason unless @must_write_reason.nil?
          hash['status'] = @status unless @status.nil?
          hash['value'] = @value unless @value.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'key'
            @key = hash['key']
          end
          if hash.has_key? 'mustWriteReason'
            @must_write_reason = hash['mustWriteReason']
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'value'
            @value = hash['value']
          end
        end
      end
    end
  end
end
