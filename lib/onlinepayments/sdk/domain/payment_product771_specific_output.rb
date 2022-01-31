#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] mandate_reference
    class PaymentProduct771SpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :mandate_reference

      # @return (Hash)
      def to_h
        hash = super
        hash['mandateReference'] = @mandate_reference unless @mandate_reference.nil?
        hash
      end

      def from_hash(hash)
        super
        @mandate_reference = hash['mandateReference'] if hash.key? 'mandateReference'
      end
    end
  end
end
