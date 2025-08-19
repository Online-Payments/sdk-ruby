#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] is_click_to_pay_payment
      class ClickToPay < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :is_click_to_pay_payment

        # @return (Hash)
        def to_h
          hash = super
          hash['IsClickToPayPayment'] = @is_click_to_pay_payment unless @is_click_to_pay_payment.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'IsClickToPayPayment'
            @is_click_to_pay_payment = hash['IsClickToPayPayment']
          end
        end
      end
    end
  end
end
