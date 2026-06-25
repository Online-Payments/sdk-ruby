require 'spec_helper'
require 'onlinepayments/sdk/declined_refund_exception'

DeclinedRefundException      ||= OnlinePayments::SDK::DeclinedRefundException
DeclinedTransactionException ||= OnlinePayments::SDK::DeclinedTransactionException

describe DeclinedRefundException do

  def make_response(error_id: 'ERR', errors: [], refund_result: nil)
    double('RefundErrorResponse', error_id: error_id, errors: errors, refund_result: refund_result)
  end

  def make_refund_result(id:, status:)
    double('RefundResponse', id: id, status: status)
  end

  describe 'without refund result' do
    subject { DeclinedRefundException.new(402, 'Declined', make_response) }

    it 'stores status_code' do
      expect(subject.status_code).to eq(402)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('Declined')
    end

    it 'returns nil refund_result' do
      expect(subject.refund_result).to be_nil
    end

    it 'uses default declined message' do
      expect(subject.message).to start_with('the payment platform returned a declined refund response')
    end
  end

  describe 'with refund result' do
    let(:refund_result) { make_refund_result(id: 'REF_001', status: 'CANCELLED') }
    let(:response)      { make_response(refund_result: refund_result) }
    subject             { DeclinedRefundException.new(402, 'Declined', response) }

    it 'uses declined message with id and status' do
      expect(subject.message).to start_with("declined refund 'REF_001' with status 'CANCELLED'")
    end

    it 'exposes the refund_result' do
      expect(subject.refund_result).to eq(refund_result)
    end
  end

  describe 'with nil response' do
    subject { DeclinedRefundException.new(402, 'body', nil) }

    it 'uses default message for nil response' do
      expect(subject.message).to start_with('the payment platform returned a declined refund response')
    end

    it 'returns nil refund_result' do
      expect(subject.refund_result).to be_nil
    end

    it 'stores nil error_id' do
      expect(subject.error_id).to be_nil
    end

    it 'has empty errors list' do
      expect(subject.errors).to be_empty
    end
  end

  describe 'message and response identity' do
    it 'keeps the response errors object and formats the declined refund message exactly' do
      errors = []
      refund_result = make_refund_result(id: 'refund-id', status: 'REJECTED')
      response = make_response(error_id: 'refund-error-id', errors: errors, refund_result: refund_result)
      ex = DeclinedRefundException.new(402, '{"error":"declined"}', response)
      expect(ex.errors).to be(errors)
      expect(ex.error_id).to eq('refund-error-id')
      expect(ex.refund_result).to be(refund_result)
      expect(ex.message).to eq(%q(declined refund 'refund-id' with status 'REJECTED'; status_code=402; response_body='{"error":"declined"}'))
    end
  end

  describe 'inheritance' do
    it 'is a DeclinedTransactionException' do
      expect(DeclinedRefundException.new(402, 'body', nil)).to be_a(DeclinedTransactionException)
    end

    it 'is an ApiException' do
      expect(DeclinedRefundException.new(402, 'body', nil)).to be_a(OnlinePayments::SDK::ApiException)
    end
  end
end
