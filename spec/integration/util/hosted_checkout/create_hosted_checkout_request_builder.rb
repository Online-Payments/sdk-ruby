require 'securerandom'
require 'onlinepayments/sdk/domain/address'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card_payment_method_specific_input_for_hosted_checkout'
require 'onlinepayments/sdk/domain/contact_details'
require 'onlinepayments/sdk/domain/create_hosted_checkout_request'
require 'onlinepayments/sdk/domain/customer'
require 'onlinepayments/sdk/domain/hosted_checkout_specific_input'
require 'onlinepayments/sdk/domain/order'
require 'onlinepayments/sdk/domain/order_references'
require 'onlinepayments/sdk/domain/personal_information'
require 'onlinepayments/sdk/domain/personal_name'

module Integration
  module Util
    module HostedCheckout
      class CreateHostedCheckoutRequestBuilder

        def initialize
          @amount = 1000
          @currency = 'EUR'
          @merchant_reference = "Ord-#{SecureRandom.uuid}"
          @merchant_customer_id = 'CUST-000001'
          @locale = 'en_US'
          @return_url = 'https://example.com/return'
          @show_result_page = true
          @session_timeout = 600
          @allowed_number_of_payment_attempts = 10
          @is_recurring = false
          @is_new_unscheduled_card_on_file_series = false
          @variant = nil
          @tokens = nil
          @country_code = 'US'
          @first_name = 'Test'
          @surname = 'User'
          @title = nil
          @email_address = nil
          @phone_number = nil
          @city = nil
          @street = nil
          @house_number = nil
          @additional_info = nil
          @state = nil
          @zip = nil
          @card_click_to_pay = false
          @card_group_cards = false
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

        def with_locale(locale)
          @locale = locale
          self
        end

        def with_return_url(return_url)
          @return_url = return_url
          self
        end

        def with_show_result_page(show_result_page)
          @show_result_page = show_result_page
          self
        end

        def with_session_timeout(session_timeout)
          @session_timeout = session_timeout
          self
        end

        def with_allowed_number_of_payment_attempts(allowed_number_of_payment_attempts)
          @allowed_number_of_payment_attempts = allowed_number_of_payment_attempts
          self
        end

        def with_is_recurring(is_recurring)
          @is_recurring = is_recurring
          self
        end

        def with_is_new_unscheduled_card_on_file_series(is_new_unscheduled_card_on_file_series)
          @is_new_unscheduled_card_on_file_series = is_new_unscheduled_card_on_file_series
          self
        end

        def with_variant(variant)
          @variant = variant
          self
        end

        def with_tokens(tokens)
          @tokens = tokens
          self
        end

        def with_country_code(country_code)
          @country_code = country_code
          self
        end

        def with_first_name(first_name)
          @first_name = first_name
          self
        end

        def with_surname(surname)
          @surname = surname
          self
        end

        def with_title(title)
          @title = title
          self
        end

        def with_email_address(email_address)
          @email_address = email_address
          self
        end

        def with_phone_number(phone_number)
          @phone_number = phone_number
          self
        end

        def with_city(city)
          @city = city
          self
        end

        def with_street(street)
          @street = street
          self
        end

        def with_house_number(house_number)
          @house_number = house_number
          self
        end

        def with_additional_info(additional_info)
          @additional_info = additional_info
          self
        end

        def with_state(state)
          @state = state
          self
        end

        def with_zip(zip)
          @zip = zip
          self
        end

        def with_card_click_to_pay(card_click_to_pay)
          @card_click_to_pay = card_click_to_pay
          self
        end

        def with_card_group_cards(card_group_cards)
          @card_group_cards = card_group_cards
          self
        end

        def build
          request = OnlinePayments::SDK::Domain::CreateHostedCheckoutRequest.new
          request.hosted_checkout_specific_input = build_hosted_checkout_specific_input
          request.order = build_order
          request
        end

        private

        def build_hosted_checkout_specific_input
          input = OnlinePayments::SDK::Domain::HostedCheckoutSpecificInput.new
          input.locale = @locale
          input.return_url = @return_url
          input.show_result_page = @show_result_page
          input.session_timeout = @session_timeout
          input.allowed_number_of_payment_attempts = @allowed_number_of_payment_attempts
          input.is_recurring = @is_recurring
          input.is_new_unscheduled_card_on_file_series = @is_new_unscheduled_card_on_file_series
          input.variant = @variant unless @variant.nil?
          input.tokens = @tokens unless @tokens.nil?
          input.card_payment_method_specific_input = build_card_payment_input
          input
        end

        def build_card_payment_input
          card_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputForHostedCheckout.new
          card_input.click_to_pay = @card_click_to_pay
          card_input.group_cards = @card_group_cards
          card_input
        end

        def build_order
          order = OnlinePayments::SDK::Domain::Order.new
          order.amount_of_money = build_amount_of_money
          order.customer = build_customer
          order.references = build_order_references
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
          customer.merchant_customer_id = @merchant_customer_id
          customer.billing_address = build_billing_address

          if !@first_name.nil? || !@surname.nil?
            customer.personal_information = build_personal_information
          end

          if !@email_address.nil? || !@phone_number.nil?
            customer.contact_details = build_contact_details
          end

          customer
        end

        def build_billing_address
          address = OnlinePayments::SDK::Domain::Address.new
          address.country_code = @country_code
          address.city = @city unless @city.nil?
          address.street = @street unless @street.nil?
          address.house_number = @house_number unless @house_number.nil?
          address.additional_info = @additional_info unless @additional_info.nil?
          address.state = @state unless @state.nil?
          address.zip = @zip unless @zip.nil?
          address
        end

        def build_personal_information
          info = OnlinePayments::SDK::Domain::PersonalInformation.new
          info.name = build_personal_name
          info
        end

        def build_personal_name
          name = OnlinePayments::SDK::Domain::PersonalName.new
          name.first_name = @first_name
          name.surname = @surname
          name.title = @title unless @title.nil?
          name
        end

        def build_contact_details
          details = OnlinePayments::SDK::Domain::ContactDetails.new
          details.email_address = @email_address unless @email_address.nil?
          details.phone_number = @phone_number unless @phone_number.nil?
          details
        end
      end
    end
  end
end
