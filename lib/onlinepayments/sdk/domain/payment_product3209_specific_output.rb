#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] buyer_compliant_bank_message
      class PaymentProduct3209SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :buyer_compliant_bank_message

        # @return (Hash)
        def to_h
          hash = super
          hash['buyerCompliantBankMessage'] = @buyer_compliant_bank_message unless @buyer_compliant_bank_message.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'buyerCompliantBankMessage'
            @buyer_compliant_bank_message = hash['buyerCompliantBankMessage']
          end
        end
      end
    end
  end
end
