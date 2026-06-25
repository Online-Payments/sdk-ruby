require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/services/get_iin_details_request_builder'
require 'integration/util/services/currency_conversion_request_builder'
require 'integration/util/services/calculate_surcharge_request_builder'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/validation_exception'

SERVICES_INVALID_BIN = '123'.freeze

RSpec.describe 'Services' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @services = @merchant.services
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when testing connection' do

    context 'with valid request' do

      it 'returns test connection' do
        response = @services.test_connection

        expect(response).not_to be_nil
        expect(response.result).not_to be_nil
      end

      it 'returns test connection with call context' do
        call_context = OnlinePayments::SDK::CallContext.new("test-services-#{SecureRandom.uuid}")

        response = @services.test_connection(call_context)

        expect(response).not_to be_nil
        expect(response.result).not_to be_nil
      end
    end
  end

  describe 'when getting IIN details' do

    context 'with valid card number' do

      it 'returns IIN details' do
        request = Integration::Util::Services::GetIINDetailsRequestBuilder.new
                                                                          .build

        response = @services.get_iin_details(request)

        expect(response).not_to be_nil
        expect(response.card_type).not_to be_nil
        expect(response.payment_product_id).not_to be_nil
        expect(response.card_scheme).not_to be_nil
      end
    end

    context 'with invalid card number' do

      it 'raises ValidationException' do
        request = Integration::Util::Services::GetIINDetailsRequestBuilder.new
                                                                          .with_bin(SERVICES_INVALID_BIN)
                                                                          .build

        expect { @services.get_iin_details(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'when getting DCC rate inquiry' do

    context 'with valid request' do

      it 'returns currency conversion response' do
        skip "Test is skipped because the Currency Conversion feature is not enabled for the test merchant."
        request = Integration::Util::Services::CurrencyConversionRequestBuilder.new
                                                                               .with_card_number('4012000033330026')
                                                                               .build

        response = @services.get_dcc_rate_inquiry(request)

        expect(response).not_to be_nil
        expect(response.result).not_to be_nil
      end
    end

    context 'with missing card source and transaction' do

      it 'raises ValidationException' do
        request = Integration::Util::Services::CurrencyConversionRequestBuilder.new
                                                                               .with_amount(1000)
                                                                               .build

        expect { @services.get_dcc_rate_inquiry(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid amount' do

      it 'raises ValidationException' do
        request = Integration::Util::Services::CurrencyConversionRequestBuilder.new
                                                                               .with_amount(-1000)
                                                                               .build

        expect { @services.get_dcc_rate_inquiry(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'when calculating surcharge' do

    context 'with valid request' do

      it 'returns surcharge calculation response' do
        skip "Test is skipped because the Surcharge Calculation feature is not enabled for the test merchant."
        request = Integration::Util::Services::CalculateSurchargeRequestBuilder.new
                                                                               .with_card_number('5425233430109903')
                                                                               .build

        response = @services.surcharge_calculation(request)

        expect(response).not_to be_nil
        expect(response.surcharges).not_to be_nil
      end
    end

    context 'with missing card source' do

      it 'raises ValidationException' do
        request = Integration::Util::Services::CalculateSurchargeRequestBuilder.new
                                                                               .build

        expect { @services.surcharge_calculation(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid amount' do

      it 'raises ValidationException' do
        request = Integration::Util::Services::CalculateSurchargeRequestBuilder.new
                                                                               .with_amount(-1000)
                                                                               .build

        expect { @services.surcharge_calculation(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end
end
