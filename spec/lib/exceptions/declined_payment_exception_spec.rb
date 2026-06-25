require 'spec_helper'
require 'onlinepayments/sdk/declined_payment_exception'

DeclinedPaymentException         ||= OnlinePayments::SDK::DeclinedPaymentException
DeclinedTransactionException     ||= OnlinePayments::SDK::DeclinedTransactionException

describe DeclinedPaymentException do

  def make_response(error_id: 'ERR', errors: [], payment_result: nil)
    double('PaymentErrorResponse', error_id: error_id, errors: errors, payment_result: payment_result)
  end

  def make_payment_result(payment:)
    double('CreatePaymentResponse', payment: payment)
  end

  def make_payment(id:, status:)
    double('PaymentResponse', id: id, status: status)
  end

  describe 'without payment result' do
    subject { DeclinedPaymentException.new(402, 'Declined', make_response) }

    it 'stores status_code' do
      expect(subject.status_code).to eq(402)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('Declined')
    end

    it 'stores error_id from response' do
      expect(subject.error_id).to eq('ERR')
    end

    it 'returns nil payment_result' do
      expect(subject.payment_result).to be_nil
    end

    it 'uses default declined message' do
      expect(subject.message).to start_with('the payment platform returned a declined payment response')
    end
  end

  describe 'with payment result but no payment' do
    subject do
      payment_result = make_payment_result(payment: nil)
      DeclinedPaymentException.new(402, 'Declined', make_response(payment_result: payment_result))
    end

    it 'uses default declined message' do
      expect(subject.message).to start_with('the payment platform returned a declined payment response')
    end

    it 'exposes the payment_result' do
      expect(subject.payment_result).not_to be_nil
    end
  end

  describe 'with payment result and payment' do
    let(:payment)        { make_payment(id: 'PAY_001', status: 'REJECTED') }
    let(:payment_result) { make_payment_result(payment: payment) }
    let(:response)       { make_response(payment_result: payment_result) }
    subject              { DeclinedPaymentException.new(402, 'Declined', response) }

    it 'uses declined message with id and status' do
      expect(subject.message).to start_with("declined payment 'PAY_001' with status 'REJECTED'")
    end

    it 'exposes the payment_result' do
      expect(subject.payment_result).to eq(payment_result)
    end
  end

  describe 'with nil response' do
    subject { DeclinedPaymentException.new(402, 'body', nil) }

    it 'uses default message for nil response' do
      expect(subject.message).to start_with('the payment platform returned a declined payment response')
    end

    it 'returns nil payment_result' do
      expect(subject.payment_result).to be_nil
    end

    it 'stores nil error_id' do
      expect(subject.error_id).to be_nil
    end

    it 'has empty errors list' do
      expect(subject.errors).to be_empty
    end
  end

  describe 'message and response identity' do
    it 'keeps the response errors object and formats the declined payment message exactly' do
      errors = []
      payment = make_payment(id: 'PAY_001', status: 'REJECTED')
      payment_result = make_payment_result(payment: payment)
      response = make_response(error_id: 'payment-error-id', errors: errors, payment_result: payment_result)
      ex = DeclinedPaymentException.new(402, '{"error":"declined"}', response)
      expect(ex.errors).to be(errors)
      expect(ex.error_id).to eq('payment-error-id')
      expect(ex.payment_result).to be(payment_result)
      expect(ex.message).to eq(%q(declined payment 'PAY_001' with status 'REJECTED'; status_code=402; response_body='{"error":"declined"}'))
    end
  end

  describe 'inheritance' do
    it 'is a DeclinedTransactionException' do
      expect(DeclinedPaymentException.new(402, 'body', nil)).to be_a(DeclinedTransactionException)
    end

    it 'is an ApiException' do
      expect(DeclinedPaymentException.new(402, 'body', nil)).to be_a(OnlinePayments::SDK::ApiException)
    end
  end
end
