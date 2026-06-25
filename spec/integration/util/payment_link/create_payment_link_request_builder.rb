require 'date'
require 'securerandom'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/create_payment_link_request'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/order_references'
require 'onlinepayments/sdk/domain/payment_link_specific_input'

module Integration
  module Util
    module PaymentLink
      class CreatePaymentLinkRequestBuilder
        def initialize
          @amount = 1000
          @currency_code = 'EUR'
          @display_qr_code = true
          @reusable_link = true
          @expiration_date = DateTime.now + 7
          @description = 'Test payment link'
          @recipient_name = 'Wile E. Coyote'
          @merchant_reference = "Ref-#{SecureRandom.uuid}"
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency_code)
          @currency_code = currency_code
          self
        end

        def with_display_qr_code(display_qr_code)
          @display_qr_code = display_qr_code
          self
        end

        def with_reusable_link(reusable_link)
          @reusable_link = reusable_link
          self
        end

        def with_expiration_date(expiration_date)
          @expiration_date = expiration_date
          self
        end

        def with_description(description)
          @description = description
          self
        end

        def with_recipient_name(recipient_name)
          @recipient_name = recipient_name
          self
        end

        def with_merchant_reference(merchant_reference)
          @merchant_reference = merchant_reference
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreatePaymentLinkRequest.new
          request.order = build_order
          request.display_qr_code = @display_qr_code
          request.is_reusable_link = @reusable_link
          request.payment_link_specific_input = build_payment_link_specific_input
          request
        end

        private

        def build_order
          order = OnlinePayments::SDK::Domain::Order.new

          amount = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount.amount = @amount
          amount.currency_code = @currency_code
          order.amount_of_money = amount

          refs = OnlinePayments::SDK::Domain::OrderReferences.new
          refs.merchant_reference = @merchant_reference
          order.references = refs

          order
        end

        def build_payment_link_specific_input
          input = OnlinePayments::SDK::Domain::PaymentLinkSpecificInput.new
          input.description = @description
          input.expiration_date = @expiration_date
          input.recipient_name = @recipient_name
          input
        end
      end
    end
  end
end
