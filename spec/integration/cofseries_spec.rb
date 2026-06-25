require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/validation_exception'
require 'integration/util/cofseries/import_cof_series_request_builder'
require 'integration/util/sdk_test_helper'

RSpec.describe 'CofSeries' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @cof_series = @merchant.cof_series

    @sdk_test_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when importing cof series' do

    context 'with valid input' do

      it 'returns import cof series response' do
        skip "Test is skipped because the Import COF Series feature is not enabled for the test merchant."
        request = Integration::Util::CofSeries::ImportCofSeriesRequestBuilder.new.build

        response = @cof_series.import_cof_series(request)

        expect(response).not_to be_nil
        expect(response.payment_id).not_to be_nil
      end

      it 'returns import cof series response with call context' do
        skip "Test is skipped because the Import COF Series feature is not enabled for the test merchant."
        request = Integration::Util::CofSeries::ImportCofSeriesRequestBuilder.new.build
        context = OnlinePayments::SDK::CallContext.new("test-cof-series-#{SecureRandom.uuid}")

        response = @cof_series.import_cof_series(request, context)

        expect(response).not_to be_nil
        expect(response.payment_id).not_to be_nil
      end
    end

    context 'with valid token id' do

      it 'returns import cof series response' do
        skip "Test is skipped because the Import COF Series feature is not enabled for the test merchant."
        token_id = @sdk_test_helper.create_token_and_get_id
        request = Integration::Util::CofSeries::ImportCofSeriesRequestBuilder.new.with_token_id(token_id).build

        response = @cof_series.import_cof_series(request)

        expect(response).not_to be_nil
        expect(response.payment_id).not_to be_nil
      end
    end

    context 'with invalid input' do

      it 'throws validation exception when scheme reference data is nil' do
        request = Integration::Util::CofSeries::ImportCofSeriesRequestBuilder.new.with_scheme_reference_data(nil).build

        expect {
          @cof_series.import_cof_series(request)
        }.to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with transaction link identifier' do

      it 'returns import cof series response with transaction link identifier' do
        skip "Test is skipped because the Import COF Series feature is not enabled for the test merchant."
        payment_id = @sdk_test_helper.create_payment_and_get_id
        request = Integration::Util::CofSeries::ImportCofSeriesRequestBuilder.new
                                                                             .with_transaction_link_identifier(payment_id)
                                                                             .build

        response = @cof_series.import_cof_series(request)

        expect(response).not_to be_nil
        expect(response.payment_id).not_to be_nil
      end
    end
  end
end
