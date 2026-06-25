require 'securerandom'
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/auto_capture'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/browser_data'
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/company_information'
require 'onlinepayments/sdk/domain/contact_details'
require 'onlinepayments/sdk/domain/create_payment_request'
require 'onlinepayments/sdk/domain/customer'
require 'onlinepayments/sdk/domain/customer_account'
require 'onlinepayments/sdk/domain/customer_account_authentication'
require 'onlinepayments/sdk/domain/customer_device'
require 'onlinepayments/sdk/domain/customer_payment_activity'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/order_references'
require 'onlinepayments/sdk/domain/payment_account_on_file'
require 'onlinepayments/sdk/domain/personal_information'
require 'onlinepayments/sdk/domain/personal_name'
require 'onlinepayments/sdk/domain/redirect_payment_method_specific_input'

module Integration
  module Util
    module Common
      class CreatePaymentRequestBuilder

        PAYMENT_METHOD_CARD = :card
        PAYMENT_METHOD_PAYPAL_REDIRECT = :paypal_redirect

        def initialize
          @card_number = '4012000033330026'
          @cvv = '123'
          @expiry_date = '0530'
          @cardholder_name = 'Wile E. Coyote'
          @amount = 1000
          @currency = 'EUR'
          @merchant_reference = "Ref-#{SecureRandom.uuid}"
          @merchant_customer_id = 'CUST-000001'
          @token = nil
          @payment_method_type = PAYMENT_METHOD_CARD
          @auto_capture = false
        end

        def with_card_number(card_number)
          @card_number = card_number
          self
        end

        def with_cvv(cvv)
          @cvv = cvv
          self
        end

        def with_expiry_date(expiry_date)
          @expiry_date = expiry_date
          self
        end

        def with_cardholder_name(cardholder_name)
          @cardholder_name = cardholder_name
          self
        end

        def with_amount(amount)
          @amount = amount
          self
        end

        def with_currency(currency)
          @currency = currency
          self
        end

        def with_merchant_reference(merchant_reference)
          @merchant_reference = merchant_reference
          self
        end

        def with_merchant_customer_id(merchant_customer_id)
          @merchant_customer_id = merchant_customer_id
          self
        end

        def with_token(token)
          @token = token
          self
        end

        def with_card_payment_method
          @payment_method_type = PAYMENT_METHOD_CARD
          self
        end

        def with_pay_pal_redirect_payment_method
          @payment_method_type = PAYMENT_METHOD_PAYPAL_REDIRECT
          self
        end

        def with_auto_capture(auto_capture)
          @auto_capture = auto_capture
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreatePaymentRequest.new

          if @payment_method_type == PAYMENT_METHOD_CARD
            request.card_payment_method_specific_input = build_card_payment_input
            request.order = build_card_order
          else
            request.redirect_payment_method_specific_input = build_redirect_payment_input
            request.order = build_pay_pal_order
          end

          request
        end

        private

        def build_card_payment_input
          input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
          input.authorization_mode = 'FINAL_AUTHORIZATION'
          input.transaction_channel = 'ECOMMERCE'
          input.return_url = 'https://example.com/return'
          input.payment_product_id = 1

          if @token
            input.token = @token
          else
            input.card = build_card
          end

          if @auto_capture
            auto_capture = OnlinePayments::SDK::Domain::AutoCapture.new
            auto_capture.delay_in_minutes = 10
            input.auto_capture = auto_capture
          end

          input
        end

        def build_redirect_payment_input
          input = OnlinePayments::SDK::Domain::RedirectPaymentMethodSpecificInput.new
          input.payment_product_id = 840
          input
        end

        def build_card
          card = OnlinePayments::SDK::Domain::Card.new
          card.cardholder_name = @cardholder_name
          card.card_number = @card_number
          card.expiry_date = @expiry_date
          card.cvv = @cvv
          card
        end

        def build_card_order
          order = OnlinePayments::SDK::Domain::Order.new
          order.amount_of_money = build_amount_of_money
          order.customer = build_customer
          order.references = build_order_references
          order
        end

        def build_pay_pal_order
          order = OnlinePayments::SDK::Domain::Order.new
          order.amount_of_money = build_amount_of_money
          refs = build_order_references
          refs.descriptor = 'Applefruitcompany'
          refs.merchant_parameters = 'SessionID=126548354&ShopperID=73541312'
          order.references = refs
          order
        end

        def build_amount_of_money
          amount = OnlinePayments::SDK::Domain::AmountOfMoney.new
          amount.amount = @amount
          amount.currency_code = @currency
          amount
        end

        def build_order_references
          refs = OnlinePayments::SDK::Domain::OrderReferences.new
          refs.merchant_reference = @merchant_reference
          refs
        end

        def build_customer
          customer = OnlinePayments::SDK::Domain::Customer.new
          customer.company_information = build_company_information
          customer.merchant_customer_id = @merchant_customer_id
          customer.account = build_customer_account
          customer.account_type = 'existing'
          customer.billing_address = build_billing_address
          customer.contact_details = build_contact_details
          customer.device = build_customer_device
          customer.personal_information = build_personal_information
          customer
        end

        def build_company_information
          info = OnlinePayments::SDK::Domain::CompanyInformation.new
          info.name = 'CUST-000001'
          info
        end

        def build_customer_account
          account = OnlinePayments::SDK::Domain::CustomerAccount.new
          account.authentication = build_authentication
          account.change_date = '20200101'
          account.changed_during_checkout = true
          account.create_date = '20100101'
          account.had_suspicious_activity = false
          account.password_change_date = '20200101'
          account.password_changed_during_checkout = false
          account.payment_account_on_file = build_payment_account_on_file
          account.payment_activity = build_payment_activity
          account
        end

        def build_authentication
          auth = OnlinePayments::SDK::Domain::CustomerAccountAuthentication.new
          auth.method = 'guest'
          auth.utc_timestamp = '202309261631'
          auth
        end

        def build_payment_account_on_file
          paf = OnlinePayments::SDK::Domain::PaymentAccountOnFile.new
          paf.create_date = '20100101'
          paf.number_of_card_on_file_creation_attempts_last24_hours = 1
          paf
        end

        def build_payment_activity
          activity = OnlinePayments::SDK::Domain::CustomerPaymentActivity.new
          activity.number_of_payment_attempts_last24_hours = 1
          activity.number_of_payment_attempts_last_year = 0
          activity.number_of_purchases_last6_months = 0
          activity
        end

        def build_billing_address
          address = OnlinePayments::SDK::Domain::Address.new
          address.country_code = 'BE'
          address.city = 'Brussels'
          address.house_number = '3'
          address.state = 'Flemish Brabant'
          address.street = 'Da Vincilaan'
          address.zip = '1930'
          address.additional_info = 'floor 9'
          address
        end

        def build_contact_details
          details = OnlinePayments::SDK::Domain::ContactDetails.new
          details.email_address = 'wile.e.coyote@acmelabs.com'
          details.phone_number = '+321234567890'
          details
        end

        def build_customer_device
          device = OnlinePayments::SDK::Domain::CustomerDevice.new
          device.accept_header = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'
          device.browser_data = build_browser_data
          device.ip_address = '123.123.123.123'
          device.locale = 'en_GB'
          device.user_agent = 'Mozilla/5.0(WindowsNT10.0;Win64;x64)AppleWebKit/537.36(KHTML,likeGecko)Chrome/75.0.3770.142Safari/537.36'
          device.timezone_offset_utc_minutes = '-180'
          device
        end

        def build_browser_data
          data = OnlinePayments::SDK::Domain::BrowserData.new
          data.color_depth = 99
          data.java_enabled = true
          data.java_script_enabled = true
          data.screen_height = '768'
          data.screen_width = '1024'
          data
        end

        def build_personal_information
          info = OnlinePayments::SDK::Domain::PersonalInformation.new
          info.name = build_personal_name
          info.gender = 'male'
          info.date_of_birth = '19500101'
          info
        end

        def build_personal_name
          name = OnlinePayments::SDK::Domain::PersonalName.new
          name.title = 'M.'
          name.first_name = 'Wile'
          name.surname = 'Coyote'
          name
        end
      end
    end
  end
end
