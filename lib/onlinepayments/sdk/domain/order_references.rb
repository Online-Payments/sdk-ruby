#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] descriptor
    # @attr [String] merchant_parameters
    # @attr [String] merchant_reference
    class OrderReferences < OnlinePayments::SDK::DataObject
      attr_accessor :descriptor
      attr_accessor :merchant_parameters
      attr_accessor :merchant_reference

      # @return (Hash)
      def to_h
        hash = super
        hash['descriptor'] = @descriptor unless @descriptor.nil?
        hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash
      end

      def from_hash(hash)
        super
        @descriptor = hash['descriptor'] if hash.key? 'descriptor'
        @merchant_parameters = hash['merchantParameters'] if hash.key? 'merchantParameters'
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
      end
    end
  end
end
