#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] key
      # @attr [String] must_write_reason
      # @attr [String] status
      # @attr [String] value
      class AccountOnFileAttribute < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :key

        # @deprecated Deprecated
        attr_accessor :must_write_reason

        attr_accessor :status

        attr_accessor :value

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
