require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/common/create_payment_request_builder'
require 'integration/util/merchant_batch/submit_batch_request_body_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

NON_EXISTING_MERCHANT_BATCH_REFERENCE = 'non-existing-batch-reference'.freeze
INVALID_MERCHANT_BATCH_REFERENCE = ''.freeze

RSpec.describe 'MerchantBatch' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @merchant_batch = @merchant.merchant_batch

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when submitting batches' do

    context 'with valid input' do

      it 'returns submitted batch' do
        create_payment_request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

        request = Integration::Util::MerchantBatch::SubmitBatchRequestBodyBuilder.new
                                                                                 .with_create_payment_requests([create_payment_request])
                                                                                 .with_operation_type('CreatePayment')
                                                                                 .with_item_count(1)
                                                                                 .build

        merchant_batch_reference = request.header.merchant_batch_reference
        response = @merchant_batch.submit_batch(request)

        expect(response).not_to be_nil
        expect(response.merchant_batch_reference).not_to be_nil
        expect(response.merchant_batch_reference).to eq(merchant_batch_reference)
        expect(response.total_count).not_to be_nil
        expect(response.total_count).to eq(1)
      end

      it 'returns submitted batch with call context' do
        create_payment_request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

        request = Integration::Util::MerchantBatch::SubmitBatchRequestBodyBuilder.new
                                                                                 .with_create_payment_requests([create_payment_request])
                                                                                 .with_operation_type('CreatePayment')
                                                                                 .with_item_count(1)
                                                                                 .build

        merchant_batch_reference = request.header.merchant_batch_reference
        call_context = OnlinePayments::SDK::CallContext.new("test-merchant-batch-#{SecureRandom.uuid}")

        response = @merchant_batch.submit_batch(request, call_context)

        expect(response).not_to be_nil
        expect(response.merchant_batch_reference).not_to be_nil
        expect(response.merchant_batch_reference).to eq(merchant_batch_reference)
        expect(response.total_count).not_to be_nil
        expect(response.total_count).to eq(1)
      end
    end

    context 'with invalid merchant batch reference' do

      it 'raises ValidationException' do
        create_payment_request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

        request = Integration::Util::MerchantBatch::SubmitBatchRequestBodyBuilder.new
                                                                                 .with_merchant_batch_reference(INVALID_MERCHANT_BATCH_REFERENCE)
                                                                                 .with_create_payment_requests([create_payment_request])
                                                                                 .with_operation_type('CreatePayment')
                                                                                 .with_item_count(1)
                                                                                 .build

        expect { @merchant_batch.submit_batch(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'when processing batches' do

    context 'with existing merchant batch reference' do

      it 'processes batch' do
        create_payment_request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

        merchant_batch_reference = @sdk_helper.submit_batch_and_get_reference(
          [create_payment_request],
          'CreatePayment',
          1
        )

        @merchant_batch.process_batch(merchant_batch_reference)

        status_response = @merchant_batch.get_batch_status(merchant_batch_reference)
        expect(status_response).not_to be_nil
        expect(status_response.status).not_to be_nil
      end
    end

    context 'with invalid merchant batch reference' do

      it 'raises ReferenceException' do
        expect { @merchant_batch.process_batch(NON_EXISTING_MERCHANT_BATCH_REFERENCE) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end

  describe 'when getting batch status' do

    context 'with existing merchant batch reference' do

      it 'returns batch status' do
        create_payment_request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

        merchant_batch_reference = @sdk_helper.submit_batch_and_get_reference(
          [create_payment_request],
          'CreatePayment',
          1
        )

        response = @merchant_batch.get_batch_status(merchant_batch_reference)

        expect(response).not_to be_nil
        expect(response.merchant_batch_reference).not_to be_nil
        expect(response.merchant_batch_reference).to eq(merchant_batch_reference)

        expect(response.item_count).not_to be_nil
        expect(response.item_count).to eq(1)

        expect(response.operation_type).not_to be_nil
        expect(response.status).not_to be_nil
      end
    end

    context 'with invalid merchant batch reference' do

      it 'raises ReferenceException' do
        expect { @merchant_batch.get_batch_status(NON_EXISTING_MERCHANT_BATCH_REFERENCE) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end
end
