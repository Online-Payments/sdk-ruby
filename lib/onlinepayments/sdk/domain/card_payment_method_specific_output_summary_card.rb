#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] card_number
      class CardPaymentMethodSpecificOutputSummaryCard < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_number

        # @return (Hash)
        def to_h
          hash = super
          hash['cardNumber'] = @card_number unless @card_number.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardNumber'
            @card_number = hash['cardNumber']
          end
        end
      end
    end
  end
end
