require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/payment_link/create_payment_link_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

UNKNOWN_PAYMENT_LINK_ID = '00000000-0000-0000-0000-000000000000'.freeze
INVALID_PAYMENT_LINK_ID = 'invalid-id'.freeze

RSpec.describe 'PaymentLinks' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payment_links_client = @merchant.payment_links

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating payment links' do
    context 'with valid input' do
      it 'returns created payment link' do
        request = Integration::Util::PaymentLink::CreatePaymentLinkRequestBuilder.new.build

        response = @payment_links_client.create_payment_link(request)

        expect(response).not_to be_nil
        expect(response.payment_link_id).not_to be_nil
        expect(response.status).not_to be_nil
        expect(response.redirection_url).not_to be_nil
      end

      it 'returns created payment link with call context' do
        request = Integration::Util::PaymentLink::CreatePaymentLinkRequestBuilder.new.build
        call_context = OnlinePayments::SDK::CallContext.new("test-payment-links-#{SecureRandom.uuid}")

        response = @payment_links_client.create_payment_link(request, call_context)

        expect(response).not_to be_nil
        expect(response.payment_link_id).not_to be_nil
        expect(response.status).not_to be_nil
        expect(response.redirection_url).not_to be_nil
      end

      it 'returns QR code base64' do
        request = Integration::Util::PaymentLink::CreatePaymentLinkRequestBuilder.new
                                                                                 .with_display_qr_code(true)
                                                                                 .build

        response = @payment_links_client.create_payment_link(request)

        expect(response).not_to be_nil
        expect(response.payment_link_id).not_to be_nil
        expect(response.qr_code_base64).not_to be_nil
      end

      it 'returns reusable link flag set to true' do
        request = Integration::Util::PaymentLink::CreatePaymentLinkRequestBuilder.new
                                                                                 .with_reusable_link(true)
                                                                                 .build

        response = @payment_links_client.create_payment_link(request)

        expect(response).not_to be_nil
        expect(response.payment_link_id).not_to be_nil
        expect(response.is_reusable_link).to eq(true)
      end
    end

    context 'with invalid amount' do
      it 'throws ValidationException' do
        request = Integration::Util::PaymentLink::CreatePaymentLinkRequestBuilder.new
                                                                                 .with_amount(-1000)
                                                                                 .with_currency('EUR')
                                                                                 .build

        expect { @payment_links_client.create_payment_link(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid expiration date' do
      it 'throws ValidationException when expiration date is in the past' do
        request = Integration::Util::PaymentLink::CreatePaymentLinkRequestBuilder.new
                                                                                 .with_expiration_date(DateTime.now - 1)
                                                                                 .build

        expect { @payment_links_client.create_payment_link(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'when getting payment links' do
    context 'with existing payment link id' do
      it 'returns payment link' do
        payment_link_id = @sdk_helper.create_payment_link_and_get_id

        response = @payment_links_client.get_payment_link_by_id(payment_link_id)

        expect(response).not_to be_nil
        expect(response.payment_link_id).not_to be_nil
        expect(response.payment_link_id).to eq(payment_link_id)
        expect(response.status).not_to be_nil
      end
    end

    context 'with invalid payment link id' do
      it 'throws ReferenceException when payment link id does not exist' do
        expect { @payment_links_client.get_payment_link_by_id(UNKNOWN_PAYMENT_LINK_ID) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end

      it 'throws ValidationException when payment link id format is invalid' do
        expect { @payment_links_client.get_payment_link_by_id(INVALID_PAYMENT_LINK_ID) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'when cancelling payment links' do
    context 'with valid payment link id' do
      it 'cancels payment link' do
        payment_link_id = @sdk_helper.create_payment_link_and_get_id

        @payment_links_client.cancel_payment_link_by_id(payment_link_id)

        response = @payment_links_client.get_payment_link_by_id(payment_link_id)

        expect(response).not_to be_nil
        expect(response.payment_link_id).to eq(payment_link_id)
        expect(response.payment_link_events).not_to be_nil
        expect(response.payment_link_events[1].type).to eq('CANCELLED')
      end
    end

    context 'with invalid payment link id' do
      it 'throws ReferenceException when payment link id does not exist' do
        expect { @payment_links_client.cancel_payment_link_by_id(UNKNOWN_PAYMENT_LINK_ID) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end

      it 'throws ValidationException when payment link id format is invalid' do
        expect { @payment_links_client.cancel_payment_link_by_id(INVALID_PAYMENT_LINK_ID) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'after previous cancel' do
      it 'throws ReferenceException' do
        payment_link_id = @sdk_helper.create_payment_link_and_get_id

        @payment_links_client.cancel_payment_link_by_id(payment_link_id)

        expect { @payment_links_client.cancel_payment_link_by_id(payment_link_id) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end
end
