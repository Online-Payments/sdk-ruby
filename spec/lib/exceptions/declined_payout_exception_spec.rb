require 'spec_helper'
require 'onlinepayments/sdk/declined_payout_exception'

DeclinedPayoutException      ||= OnlinePayments::SDK::DeclinedPayoutException
DeclinedTransactionException ||= OnlinePayments::SDK::DeclinedTransactionException

describe DeclinedPayoutException do

  def make_response(error_id: 'ERR', errors: [], payout_result: nil)
    double('PayoutErrorResponse', error_id: error_id, errors: errors, payout_result: payout_result)
  end

  def make_payout_result(id:, status:)
    double('PayoutResult', id: id, status: status)
  end

  describe 'without payout result' do
    subject { DeclinedPayoutException.new(402, 'Declined', make_response) }

    it 'stores status_code' do
      expect(subject.status_code).to eq(402)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('Declined')
    end

    it 'returns nil payout_result' do
      expect(subject.payout_result).to be_nil
    end

    it 'uses default declined message' do
      expect(subject.message).to start_with('the payment platform returned a declined payout response')
    end
  end

  describe 'with payout result' do
    let(:payout_result) { make_payout_result(id: 'PO_001', status: 'REJECTED') }
    let(:response)      { make_response(payout_result: payout_result) }
    subject             { DeclinedPayoutException.new(402, 'Declined', response) }

    it 'uses declined message with id and status' do
      expect(subject.message).to start_with("declined payout 'PO_001' with status 'REJECTED'")
    end

    it 'exposes the payout_result' do
      expect(subject.payout_result).to eq(payout_result)
    end
  end

  describe 'with nil response' do
    subject { DeclinedPayoutException.new(402, 'body', nil) }

    it 'uses default message for nil response' do
      expect(subject.message).to start_with('the payment platform returned a declined payout response')
    end

    it 'returns nil payout_result' do
      expect(subject.payout_result).to be_nil
    end

    it 'stores nil error_id' do
      expect(subject.error_id).to be_nil
    end

    it 'has empty errors list' do
      expect(subject.errors).to be_empty
    end
  end

  describe 'message and response identity' do
    it 'keeps the response errors object and formats the declined payout message exactly' do
      errors = []
      payout_result = make_payout_result(id: 'payout-id', status: 'REJECTED')
      response = make_response(error_id: 'payout-error-id', errors: errors, payout_result: payout_result)
      ex = DeclinedPayoutException.new(402, '{"error":"declined"}', response)
      expect(ex.errors).to be(errors)
      expect(ex.error_id).to eq('payout-error-id')
      expect(ex.payout_result).to be(payout_result)
      expect(ex.message).to eq(%q(declined payout 'payout-id' with status 'REJECTED'; status_code=402; response_body='{"error":"declined"}'))
    end
  end

  describe 'inheritance' do
    it 'is a DeclinedTransactionException' do
      expect(DeclinedPayoutException.new(402, 'body', nil)).to be_a(DeclinedTransactionException)
    end

    it 'is an ApiException' do
      expect(DeclinedPayoutException.new(402, 'body', nil)).to be_a(OnlinePayments::SDK::ApiException)
    end
  end
end
