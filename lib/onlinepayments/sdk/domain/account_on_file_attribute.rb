#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] key
    # @attr [String] must_write_reason
    # @attr [String] status
    # @attr [String] value
    class AccountOnFileAttribute < OnlinePayments::SDK::DataObject
      attr_accessor :key
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
        @key = hash['key'] if hash.key? 'key'
        @must_write_reason = hash['mustWriteReason'] if hash.key? 'mustWriteReason'
        @status = hash['status'] if hash.key? 'status'
        @value = hash['value'] if hash.key? 'value'
      end
    end
  end
end
