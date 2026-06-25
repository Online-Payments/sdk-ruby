require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/payout/create_payout_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

NON_EXISTING_PAYOUT_ID = '9999999999_0'.freeze

RSpec.describe 'Payouts' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payouts = @merchant.payouts

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating payouts' do

    context 'with valid card input' do

      it 'returns created payout' do
        request = Integration::Util::Payout::CreatePayoutRequestBuilder.new.build

        response = @payouts.create_payout(request)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id).not_to be_empty

        expect(response.status).not_to be_nil
        expect(response.payout_output).not_to be_nil
        expect(response.payout_output.amount_of_money).not_to be_nil

        expect(response.payout_output.amount_of_money.amount).to eq(request.amount_of_money.amount)
        expect(response.payout_output.amount_of_money.currency_code).to eq(request.amount_of_money.currency_code)
      end

      it 'returns created payout with call context' do
        request = Integration::Util::Payout::CreatePayoutRequestBuilder.new.build
        call_context = OnlinePayments::SDK::CallContext.new("test-payouts-#{SecureRandom.uuid}")

        response = @payouts.create_payout(request, call_context)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id).not_to be_empty

        expect(response.status).not_to be_nil
        expect(response.payout_output).not_to be_nil

        expect(response.payout_output.amount_of_money).not_to be_nil
        expect(response.payout_output.amount_of_money.amount).to eq(request.amount_of_money.amount)
        expect(response.payout_output.amount_of_money.currency_code).to eq(request.amount_of_money.currency_code)
      end
    end

    context 'with invalid amount' do

      it 'raises ValidationException' do
        request = Integration::Util::Payout::CreatePayoutRequestBuilder.new
                                                                       .with_amount(-1000)
                                                                       .with_currency('EUR')
                                                                       .build

        exception = nil
        expect { @payouts.create_payout(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception).not_to be_nil
        expect(exception.errors).not_to be_nil
        expect(exception.errors).not_to be_empty
        expect(exception.error_id).not_to be_nil

        error = exception.errors.first
        expect(error.id).to eq('INVALID_VALUE')
        expect(error.http_status_code).to eq(400)
      end
    end

    context 'with invalid currency code' do

      it 'raises ValidationException' do
        request = Integration::Util::Payout::CreatePayoutRequestBuilder.new
                                                                       .with_amount(1000)
                                                                       .with_currency('INVALID')
                                                                       .build

        exception = nil
        expect { @payouts.create_payout(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception).not_to be_nil
        expect(exception.errors).not_to be_nil
        expect(exception.errors).not_to be_empty
        expect(exception.error_id).not_to be_nil

        error = exception.errors.first
        expect(error.id).to eq('INVALID_VALUE')
        expect(error.http_status_code).to eq(400)
      end
    end

    context 'with invalid card number' do

      it 'raises ValidationException' do
        request = Integration::Util::Payout::CreatePayoutRequestBuilder.new
                                                                       .with_card_number('123')
                                                                       .build

        exception = nil
        expect { @payouts.create_payout(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

        expect(exception).not_to be_nil
        expect(exception.errors).not_to be_nil
        expect(exception.errors).not_to be_empty
        expect(exception.error_id).not_to be_nil

        error = exception.errors.first
        expect(error.id).to eq('INVALID_VALUE')
        expect(error.http_status_code).to eq(400)
      end
    end
  end

  describe 'when getting payouts' do

    context 'with existing payout id' do

      it 'returns payout' do
        payout_id = @sdk_helper.create_payout_and_get_id

        response = @payouts.get_payout(payout_id)

        expect(response).not_to be_nil
        expect(response.id).not_to be_nil
        expect(response.id).not_to be_empty
        expect(response.id).to eq(payout_id)

        expect(response.status).not_to be_nil
        expect(response.status).not_to be_empty
        expect(response.status).to eq('ACCOUNT_CREDITED')

        expect(response.payout_output).not_to be_nil
        expect(response.status_output).not_to be_nil
        expect(response.status_output.status_category).to eq('REFUNDED')
        expect(response.status_output.status_code).to eq(8)
      end
    end

    context 'with invalid payout id' do

      it 'raises ReferenceException' do
        expect { @payouts.get_payout(NON_EXISTING_PAYOUT_ID) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end
end
