#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] buyer_compliant_bank_message
    class PaymentProduct3209SpecificOutput < OnlinePayments::SDK::DataObject
      attr_accessor :buyer_compliant_bank_message

      # @return (Hash)
      def to_h
        hash = super
        hash['buyerCompliantBankMessage'] = @buyer_compliant_bank_message unless @buyer_compliant_bank_message.nil?
        hash
      end

      def from_hash(hash)
        super
        @buyer_compliant_bank_message = hash['buyerCompliantBankMessage'] if hash.key? 'buyerCompliantBankMessage'
      end
    end
  end
end
