require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'

require 'integration/util/hosted_checkout/create_hosted_checkout_request_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/factory'

INVALID_HOSTED_CHECKOUT_ID = '9999999999'.freeze

RSpec.describe 'HostedCheckout' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @hosted_checkout = @client.merchant(Integration::MERCHANT_ID).hosted_checkout
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating hosted checkout' do

    context 'with card payment' do

      it 'returns hosted checkout with card' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_first_name('John')
                                                                                       .with_surname('Doe')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with card and customer details' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_amount(5000)
                                                                                       .with_currency('EUR')
                                                                                       .with_country_code('DE')
                                                                                       .with_locale('en_GB')
                                                                                       .with_first_name('Jane')
                                                                                       .with_surname('Smith')
                                                                                       .with_email_address('jane@example.com')
                                                                                       .with_phone_number('+441234567890')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with card and filters' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_first_name('Bob')
                                                                                       .with_surname('Johnson')
                                                                                       .with_amount(2500)
                                                                                       .with_currency('EUR')
                                                                                       .with_country_code('DE')
                                                                                       .with_locale('de_DE')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with session timeout' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_session_timeout(300)
                                                                                       .with_first_name('Alex')
                                                                                       .with_surname('Williams')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with different locales' do
        %w[en_US de_DE fr_FR es_ES it_IT nl_NL].each do |locale|
          request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                         .with_locale(locale)
                                                                                         .with_first_name('Test')
                                                                                         .with_surname('User')
                                                                                         .build

          response = @hosted_checkout.create_hosted_checkout(request)

          expect(response).not_to be_nil
          expect(response.hosted_checkout_id).not_to be_nil
          expect(response.redirect_url).not_to be_nil
          expect(response.redirect_url).not_to be_empty
        end
      end

      it 'returns hosted checkout with custom amount' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_amount(9999)
                                                                                       .with_currency('EUR')
                                                                                       .with_first_name('Rich')
                                                                                       .with_surname('Customer')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with billing address' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_first_name('John')
                                                                                       .with_surname('Resident')
                                                                                       .with_country_code('US')
                                                                                       .with_city('San Francisco')
                                                                                       .with_street('Main Street')
                                                                                       .with_house_number('123')
                                                                                       .with_state('CA')
                                                                                       .with_zip('94102')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with click to pay' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_card_click_to_pay(true)
                                                                                       .with_first_name('ClickToPay')
                                                                                       .with_surname('Customer')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with group cards' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_card_group_cards(true)
                                                                                       .with_first_name('GroupCards')
                                                                                       .with_surname('Customer')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end

      it 'returns hosted checkout with call context' do
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_first_name('CallContext')
                                                                                       .with_surname('Test')
                                                                                       .build

        call_context = OnlinePayments::SDK::CallContext.new("test-hosted-checkout-#{SecureRandom.uuid}")
        response = @hosted_checkout.create_hosted_checkout(request, call_context)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end
    end
  end

  describe 'when retrieving hosted checkout' do

    it 'retrieves hosted checkout status' do
      create_request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                            .with_first_name('Status')
                                                                                            .with_surname('Check')
                                                                                            .build

      create_response = @hosted_checkout.create_hosted_checkout(create_request)
      hosted_checkout_id = create_response.hosted_checkout_id
      expect(hosted_checkout_id).not_to be_nil

      get_response = @hosted_checkout.get_hosted_checkout(hosted_checkout_id)

      expect(get_response).not_to be_nil
      expect(get_response.status).not_to be_nil
    end

    it 'retrieves created hosted checkout' do
      create_request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                            .with_amount(7500)
                                                                                            .with_currency('EUR')
                                                                                            .with_country_code('DE')
                                                                                            .with_locale('en_GB')
                                                                                            .with_first_name('Retrieve')
                                                                                            .with_surname('Payment')
                                                                                            .build

      create_response = @hosted_checkout.create_hosted_checkout(create_request)
      hosted_checkout_id = create_response.hosted_checkout_id
      expect(hosted_checkout_id).not_to be_nil

      get_response = @hosted_checkout.get_hosted_checkout(hosted_checkout_id)

      expect(get_response).not_to be_nil
      expect(get_response.created_payment_output).not_to be_nil
    end

    context 'with invalid hosted checkout id' do

      it 'raises ReferenceException with status code 404' do
        exception = nil
        expect {
          @hosted_checkout.get_hosted_checkout(INVALID_HOSTED_CHECKOUT_ID)
        }.to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

        expect(exception.status_code).to eq(404)
      end
    end
  end

  describe 'when using show result page' do

    it 'creates hosted checkout with result page hidden' do
      request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                     .with_show_result_page(false)
                                                                                     .with_first_name('Silent')
                                                                                     .with_surname('Payment')
                                                                                     .build

      response = @hosted_checkout.create_hosted_checkout(request)

      expect(response).not_to be_nil
      expect(response.hosted_checkout_id).not_to be_nil
      expect(response.redirect_url).not_to be_nil
      expect(response.redirect_url).not_to be_empty
    end

    it 'creates hosted checkout with result page shown' do
      request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                     .with_show_result_page(true)
                                                                                     .with_first_name('Visible')
                                                                                     .with_surname('Result')
                                                                                     .build

      response = @hosted_checkout.create_hosted_checkout(request)

      expect(response).not_to be_nil
      expect(response.hosted_checkout_id).not_to be_nil
      expect(response.redirect_url).not_to be_nil
      expect(response.redirect_url).not_to be_empty
    end
  end

  describe 'when using recurring payments' do

    it 'creates recurring hosted checkout' do
      request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                     .with_is_recurring(true)
                                                                                     .with_first_name('Recurring')
                                                                                     .with_surname('Customer')
                                                                                     .build

      response = @hosted_checkout.create_hosted_checkout(request)

      expect(response).not_to be_nil
      expect(response.hosted_checkout_id).not_to be_nil
      expect(response.redirect_url).not_to be_nil
      expect(response.redirect_url).not_to be_empty
    end

    it 'creates one-off hosted checkout' do
      request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                     .with_is_recurring(false)
                                                                                     .with_first_name('OneOff')
                                                                                     .with_surname('Payment')
                                                                                     .build

      response = @hosted_checkout.create_hosted_checkout(request)

      expect(response).not_to be_nil
      expect(response.hosted_checkout_id).not_to be_nil
      expect(response.redirect_url).not_to be_nil
      expect(response.redirect_url).not_to be_empty
    end
  end

  describe 'when using tokenization' do

    it 'creates hosted checkout with new unscheduled card on file' do
      request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                     .with_is_new_unscheduled_card_on_file_series(true)
                                                                                     .with_first_name('Card')
                                                                                     .with_surname('OnFile')
                                                                                     .build

      response = @hosted_checkout.create_hosted_checkout(request)

      expect(response).not_to be_nil
      expect(response.hosted_checkout_id).not_to be_nil
      expect(response.redirect_url).not_to be_nil
      expect(response.redirect_url).not_to be_empty
    end

    it 'creates hosted checkout without tokenization' do
      request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                     .with_is_new_unscheduled_card_on_file_series(false)
                                                                                     .with_first_name('No')
                                                                                     .with_surname('Token')
                                                                                     .build

      response = @hosted_checkout.create_hosted_checkout(request)

      expect(response).not_to be_nil
      expect(response.hosted_checkout_id).not_to be_nil
      expect(response.redirect_url).not_to be_nil
      expect(response.redirect_url).not_to be_empty
    end
  end

  describe 'when creating multiple checkouts' do

    it 'creates multiple hosted checkouts' do
      3.times do |i|
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_first_name('Batch')
                                                                                       .with_surname("Customer#{i}")
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end
    end

    it 'creates checkouts with different amounts' do
      [1000, 2500, 5000, 10000].each do |amount|
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_amount(amount)
                                                                                       .with_currency('EUR')
                                                                                       .with_first_name('Amount')
                                                                                       .with_surname('Test')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end
    end

    it 'creates checkouts with different currencies' do
      %w[EUR GBP USD CHF SEK].each do |currency|
        request = Integration::Util::HostedCheckout::CreateHostedCheckoutRequestBuilder.new
                                                                                       .with_amount(2000)
                                                                                       .with_currency(currency)
                                                                                       .with_first_name('Currency')
                                                                                       .with_surname('Test')
                                                                                       .build

        response = @hosted_checkout.create_hosted_checkout(request)

        expect(response).not_to be_nil
        expect(response.hosted_checkout_id).not_to be_nil
        expect(response.redirect_url).not_to be_nil
        expect(response.redirect_url).not_to be_empty
      end
    end
  end
end
