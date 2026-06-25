require 'spec_helper'
require 'onlinepayments/sdk/exception_factory'
require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/payment_error_response'
require 'onlinepayments/sdk/domain/payout_error_response'
require 'onlinepayments/sdk/domain/problem_details_response'
require 'onlinepayments/sdk/domain/refund_error_response'
require 'onlinepayments/sdk/domain/api_error'

ErrorResponse         ||= OnlinePayments::SDK::Domain::ErrorResponse
PaymentErrorResponse  ||= OnlinePayments::SDK::Domain::PaymentErrorResponse
PayoutErrorResponse   ||= OnlinePayments::SDK::Domain::PayoutErrorResponse
RefundErrorResponse   ||= OnlinePayments::SDK::Domain::RefundErrorResponse
ProblemDetailsResponse ||= OnlinePayments::SDK::Domain::ProblemDetailsResponse
APIError              ||= OnlinePayments::SDK::Domain::APIError
DeclinedPaymentException ||= OnlinePayments::SDK::DeclinedPaymentException
DeclinedPayoutException  ||= OnlinePayments::SDK::DeclinedPayoutException
DeclinedRefundException  ||= OnlinePayments::SDK::DeclinedRefundException
ValidationException      ||= OnlinePayments::SDK::ValidationException
AuthorizationException   ||= OnlinePayments::SDK::AuthorizationException
ReferenceException       ||= OnlinePayments::SDK::ReferenceException
IdempotenceException     ||= OnlinePayments::SDK::IdempotenceException
PlatformException        ||= OnlinePayments::SDK::PlatformException
ApiException             ||= OnlinePayments::SDK::ApiException
ProblemDetailsException  ||= OnlinePayments::SDK::ProblemDetailsException
CallContext              ||= OnlinePayments::SDK::CallContext

describe 'ExceptionFactory' do

  def make_error(code)
    e = APIError.new
    e.error_code = code
    e
  end

  def create(status_code, error_object, context = nil)
    OnlinePayments::SDK.create_exception(status_code, 'body', error_object, context)
  end

  context 'PaymentErrorResponse with payment_result' do
    it 'returns DeclinedPaymentException' do
      response = PaymentErrorResponse.new
      response.payment_result = double('CreatePaymentResponse', payment: nil)
      expect(create(402, response)).to be_a(DeclinedPaymentException)
    end
  end

  context 'PaymentErrorResponse without payment_result' do
    it 'returns ValidationException for 400' do
      response = PaymentErrorResponse.new
      expect(create(400, response)).to be_a(ValidationException)
    end

    it 'returns PlatformException for 500' do
      response = PaymentErrorResponse.new
      expect(create(500, response)).to be_a(PlatformException)
    end
  end

  context 'PayoutErrorResponse with payout_result' do
    it 'returns DeclinedPayoutException' do
      response = PayoutErrorResponse.new
      response.payout_result = double('PayoutResult', id: 'P1', status: 'REJECTED')
      expect(create(402, response)).to be_a(DeclinedPayoutException)
    end
  end

  context 'PayoutErrorResponse without payout_result' do
    it 'returns AuthorizationException for 403' do
      response = PayoutErrorResponse.new
      expect(create(403, response)).to be_a(AuthorizationException)
    end
  end

  context 'RefundErrorResponse with refund_result' do
    it 'returns DeclinedRefundException' do
      response = RefundErrorResponse.new
      response.refund_result = double('RefundResponse', id: 'R1', status: 'CANCELLED')
      expect(create(402, response)).to be_a(DeclinedRefundException)
    end
  end

  context 'RefundErrorResponse without refund_result' do
    it 'returns ReferenceException for 404' do
      response = RefundErrorResponse.new
      expect(create(404, response)).to be_a(ReferenceException)
    end
  end

  context 'ProblemDetailsResponse' do
    it 'returns ProblemDetailsException' do
      response = ProblemDetailsResponse.new
      ex = create(400, response)
      expect(ex).to be_a(ProblemDetailsException)
    end

    it 'stores the status_code in the exception' do
      response = ProblemDetailsResponse.new
      ex = create(422, response)
      expect(ex.status_code).to eq(422)
    end

    it 'stores the response_body in the exception' do
      response = ProblemDetailsResponse.new
      ex = OnlinePayments::SDK.create_exception(400, '{"type":"about:blank"}', response, nil)
      expect(ex.response_body).to eq('{"type":"about:blank"}')
    end

    it 'stores the ProblemDetailsResponse object in the exception' do
      response = ProblemDetailsResponse.new
      ex = create(400, response)
      expect(ex.response).to be(response)
    end
  end

  context 'ErrorResponse' do
    let(:error_response) { ErrorResponse.new }

    it 'returns ValidationException for 400' do
      expect(create(400, error_response)).to be_a(ValidationException)
    end

    it 'returns AuthorizationException for 403' do
      expect(create(403, error_response)).to be_a(AuthorizationException)
    end

    it 'returns ReferenceException for 404' do
      expect(create(404, error_response)).to be_a(ReferenceException)
    end

    it 'returns ReferenceException for 409 without idempotence key' do
      expect(create(409, error_response, nil)).to be_a(ReferenceException)
    end

    it 'returns ReferenceException for 409 with context but no idempotence key' do
      context = CallContext.new(nil)
      expect(create(409, error_response, context)).to be_a(ReferenceException)
    end

    it 'returns ReferenceException for 409 with idempotence key but non-1409 error code' do
      error_response.errors = [make_error('9999')]
      context = CallContext.new('idem-key')
      expect(create(409, error_response, context)).to be_a(ReferenceException)
    end

    it 'returns IdempotenceException for 409 with idempotence key and 1409 error code' do
      error_response.errors = [make_error('1409')]
      context = CallContext.new('idem-key')
      context.idempotence_request_timestamp = 1_234_567_890
      ex = create(409, error_response, context)
      expect(ex).to be_a(IdempotenceException)
      expect(ex.idempotence_key).to eq('idem-key')
      expect(ex.idempotence_request_timestamp).to eq(1_234_567_890)
    end

    it 'returns ReferenceException for 410' do
      expect(create(410, error_response)).to be_a(ReferenceException)
    end

    it 'returns PlatformException for 500' do
      expect(create(500, error_response)).to be_a(PlatformException)
    end

    it 'returns PlatformException for 502' do
      expect(create(502, error_response)).to be_a(PlatformException)
    end

    it 'returns PlatformException for 503' do
      expect(create(503, error_response)).to be_a(PlatformException)
    end

    it 'returns ApiException for unknown status codes' do
      expect(create(418, error_response)).to be_a(ApiException)
    end

    it 'stores status_code in the returned exception' do
      ex = create(400, error_response)
      expect(ex.status_code).to eq(400)
    end
  end

  context 'unsupported error_object type' do
    it 'raises ArgumentError for an unsupported object' do
      expect { create(400, Object.new) }.to raise_error(ArgumentError, /unsupported error object type/)
    end
  end

  context 'nil error_object' do
    it 'returns ApiException for nil error_object' do
      ex = create(418, nil)
      expect(ex).to be_a(ApiException)
    end

    it 'stores status_code in the returned exception' do
      ex = create(418, nil)
      expect(ex.status_code).to eq(418)
    end

    it 'stores response_body in the returned exception' do
      ex = OnlinePayments::SDK.create_exception(418, '{"error":"unknown"}', nil, nil)
      expect(ex.response_body).to eq('{"error":"unknown"}')
    end

    it 'has nil error_id' do
      ex = create(418, nil)
      expect(ex.error_id).to be_nil
    end

    it 'has empty errors list' do
      ex = create(418, nil)
      expect(ex.errors).not_to be_nil
      expect(ex.errors).to be_empty
    end
  end
end
