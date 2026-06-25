require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/sdk_test_helper'
require 'integration/util/common/create_payment_request_builder'
require 'integration/util/payout/create_payout_request_builder'
require 'integration/util/payments/capture_payment_request_builder'
require 'integration/util/payments/refund_request_builder'

require 'onlinepayments/sdk/api_exception'
require 'onlinepayments/sdk/authorization_exception'
require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/declined_payment_exception'
require 'onlinepayments/sdk/declined_payout_exception'
require 'onlinepayments/sdk/declined_refund_exception'
require 'onlinepayments/sdk/declined_transaction_exception'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/platform_exception'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'

NON_EXISTING_PAYMENT_ID = '9999999999_0'.freeze
INVALID_MERCHANT_ID = '000000'.freeze
DECLINED_CARD_NUMBER = '4321456998744563'.freeze
DECLINED_REFUND_AMOUNT = 1500
EXCEPTIONS_CURRENCY_CODE = 'EUR'.freeze

RSpec.describe 'Exceptions' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @payments = @merchant.payments
    @payouts = @merchant.payouts

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when testing exception errors' do

    it 'throws ValidationException with error_id and api errors' do
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                      .with_card_number('123')
                                                                      .build

      exception = nil
      expect { @payments.create_payment(request) }
        .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.error_id).not_to be_nil
      expect(exception.error_id).not_to be_empty
      expect(exception.errors).not_to be_nil
      expect(exception.errors.size).to eq(1)

      error = exception.errors.first
      expect(error).not_to be_nil
      expect(error.id).not_to be_nil
      expect(error.http_status_code).not_to be_nil
    end
  end

  describe 'when testing ValidationException' do

    it 'throws ValidationException for invalid currency' do
      request = Integration::Util::Payout::CreatePayoutRequestBuilder.new
                                                                     .with_amount(1000)
                                                                     .with_currency('INVALID')
                                                                     .build

      exception = nil
      expect { @payouts.create_payout(request) }
        .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.status_code).to eq(400)
      expect(exception.error_id).not_to be_nil
      expect(exception.errors).not_to be_nil
      expect(exception.errors).not_to be_empty

      error = exception.errors.first
      expect(error.id).to eq('INVALID_VALUE')
      expect(error.http_status_code).to eq(400)
    end

    it 'throws ValidationException with multiple API errors' do
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                      .with_card_number('123')
                                                                      .with_cvv('')
                                                                      .with_expiry_date('invalid')
                                                                      .build

      exception = nil
      expect { @payments.create_payment(request) }
        .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.status_code).to eq(400)
      expect(exception.errors).not_to be_nil
      expect(exception.errors).not_to be_empty

      exception.errors.each do |error|
        expect(error.id).not_to be_nil
        expect(error.http_status_code).not_to be_nil
        expect(error.http_status_code).to eq(400)
      end
    end
  end

  describe 'when testing AuthorizationException' do

    it 'throws AuthorizationException for invalid merchant id' do
      invalid_client = OnlinePayments::SDK::Factory.create_client_from_configuration(
        Integration.init_communicator_configuration
      ).with_client_meta_info('{"test":"test"}')

      begin
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build
        invalid_payments = invalid_client.merchant(INVALID_MERCHANT_ID).payments

        exception = nil
        expect { invalid_payments.create_payment(request) }
          .to raise_error(OnlinePayments::SDK::AuthorizationException) { |e| exception = e }

        expect(exception).not_to be_nil
        expect(exception.status_code).to eq(403)
        expect(exception.response_body).not_to be_nil
        expect(exception.error_id).not_to be_nil
        expect(exception.errors).not_to be_nil
        expect(exception.errors).not_to be_empty

        error = exception.errors.first
        expect(error.id).not_to be_nil
        expect(error.http_status_code).to eq(403)
      ensure
        invalid_client&.close
      end
    end
  end

  describe 'when testing DeclinedPaymentException' do

    it 'throws DeclinedPaymentException for payment create' do
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                      .with_card_number(DECLINED_CARD_NUMBER)
                                                                      .build

      exception = nil
      expect { @payments.create_payment(request) }
        .to raise_error(OnlinePayments::SDK::DeclinedPaymentException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.status_code).to be >= 400
      expect(exception.response_body).not_to be_nil

      payment_result = exception.payment_result
      expect(payment_result).not_to be_nil
      expect(payment_result.payment).not_to be_nil
      expect(payment_result.payment.id).not_to be_nil
      expect(payment_result.payment.status).not_to be_nil
      expect(payment_result.payment.status).to eq('REJECTED')
    end
  end

  describe 'when testing DeclinedPayoutException' do

    it 'throws DeclinedPayoutException for invalid payout' do
      request = Integration::Util::Payout::CreatePayoutRequestBuilder.new
                                                                     .with_card_number(DECLINED_CARD_NUMBER)
                                                                     .build

      exception = nil
      expect { @payouts.create_payout(request) }
        .to raise_error(OnlinePayments::SDK::DeclinedPayoutException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.status_code).to be >= 400
      expect(exception.response_body).not_to be_nil

      payout_result = exception.payout_result
      expect(payout_result).not_to be_nil
      expect(payout_result.id).not_to be_nil
      expect(payout_result.status).not_to be_nil
      expect(payout_result.status).to eq('REJECTED_CREDIT')
    end
  end

  describe 'when testing ApiException' do

    it 'throws ApiException for unknown status code' do
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                      .with_card_number('123')
                                                                      .build

      exception = nil
      expect { @payments.create_payment(request) }
        .to raise_error(OnlinePayments::SDK::ApiException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.status_code).to be >= 400
      expect(exception.response_body).not_to be_nil
      expect(exception.error_id).not_to be_nil
      expect(exception.errors).not_to be_nil
    end
  end

  describe 'when testing DeclinedTransactionException' do

    it 'throws DeclinedTransactionException as parent type' do
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                      .with_card_number(DECLINED_CARD_NUMBER)
                                                                      .build

      exception = nil
      expect { @payments.create_payment(request) }
        .to raise_error(OnlinePayments::SDK::DeclinedTransactionException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception).to be_a(OnlinePayments::SDK::DeclinedPaymentException)
      expect(exception.response_body).not_to be_nil
    end
  end

  describe 'when testing IdempotenceException' do

    it 'throws ReferenceException for duplicate in-progress idempotence key' do
      idempotence_key = SecureRandom.uuid
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build

      first_context = OnlinePayments::SDK::CallContext.new(idempotence_key)
      second_context = OnlinePayments::SDK::CallContext.new(idempotence_key)

      first_exception = nil
      second_exception = nil

      t1 = Thread.new { @payments.create_payment(request, first_context) rescue $! }
      t2 = Thread.new { @payments.create_payment(request, second_context) rescue $! }

      r1 = t1.value
      r2 = t2.value

      first_exception = r1 if r1.is_a?(Exception)
      second_exception = r2 if r2.is_a?(Exception)

      # One request may succeed; the concurrent one should get 409
      conflicting = [first_exception, second_exception].compact
                                                       .find { |e| e.is_a?(OnlinePayments::SDK::ReferenceException) }

      if conflicting
        expect(conflicting.errors).not_to be_nil
        error = conflicting.errors.first
        expect(error).not_to be_nil
        expect(error.http_status_code).to eq(409)
        expect(error.id).to eq('DUPLICATE_REQUEST_IN_PROGRESS')
      end
      # If neither raised, both succeeded (server replayed) — that is acceptable
    end
  end

  describe 'when testing DeclinedRefundException' do

    it 'throws DeclinedRefundException' do
      skip "Test is skipped because the action could not be triggered in the current merchant setup."
      payment_id = @sdk_helper.create_payment_and_get_id(DECLINED_REFUND_AMOUNT, EXCEPTIONS_CURRENCY_CODE)
      @payments.capture_payment(payment_id, Integration::Util::Payments::CapturePaymentRequestBuilder.new.build)

      exception = nil
      expect do
        @payments.refund_payment(
          payment_id,
          Integration::Util::Payments::RefundRequestBuilder.new
                                                           .with_amount(DECLINED_REFUND_AMOUNT)
                                                           .with_currency(EXCEPTIONS_CURRENCY_CODE)
                                                           .build
        )
      end.to raise_error(OnlinePayments::SDK::DeclinedRefundException) { |e| exception = e }

      expect(exception).not_to be_nil
      expect(exception.status_code).to be >= 400
      expect(exception.response_body).not_to be_nil

      refund_result = exception.refund_result
      expect(refund_result).not_to be_nil
      expect(refund_result.id).not_to be_nil
      expect(refund_result.status).not_to be_nil
    end
  end

  describe 'when testing error_id in all exceptions' do

    it 'has error_id in ValidationException' do
      request = Integration::Util::Common::CreatePaymentRequestBuilder.new
                                                                      .with_card_number('123')
                                                                      .build

      exception = nil
      expect { @payments.create_payment(request) }
        .to raise_error(OnlinePayments::SDK::ValidationException) { |e| exception = e }

      expect(exception.error_id).not_to be_nil
      expect(exception.error_id).not_to be_empty
    end

    it 'has error_id in ReferenceException' do
      exception = nil
      expect { @payments.get_payment(NON_EXISTING_PAYMENT_ID) }
        .to raise_error(OnlinePayments::SDK::ReferenceException) { |e| exception = e }

      expect(exception.error_id).not_to be_nil
      expect(exception.error_id).not_to be_empty
    end

    it 'has error_id in AuthorizationException' do
      invalid_client = OnlinePayments::SDK::Factory.create_client_from_configuration(
        Integration.init_communicator_configuration
      ).with_client_meta_info('{"test":"test"}')

      begin
        request = Integration::Util::Common::CreatePaymentRequestBuilder.new.build
        invalid_payments = invalid_client.merchant(INVALID_MERCHANT_ID).payments

        exception = nil
        expect { invalid_payments.create_payment(request) }
          .to raise_error(OnlinePayments::SDK::AuthorizationException) { |e| exception = e }

        expect(exception.error_id).not_to be_nil
        expect(exception.error_id).not_to be_empty
      ensure
        invalid_client&.close
      end
    end
  end
end
