# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] buyer_compliant_bank_message
      class PaymentProduct3208SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :buyer_compliant_bank_message

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(buyer_compliant_bank_message: nil)
          super()
          @buyer_compliant_bank_message = buyer_compliant_bank_message
        end

        # Sets the property and returns this same instance.
        def with_buyer_compliant_bank_message(value)
          @buyer_compliant_bank_message = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['buyerCompliantBankMessage'] = @buyer_compliant_bank_message unless @buyer_compliant_bank_message.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'buyerCompliantBankMessage'
            @buyer_compliant_bank_message = hash['buyerCompliantBankMessage']
          end
        end
      end
    end
  end
end
