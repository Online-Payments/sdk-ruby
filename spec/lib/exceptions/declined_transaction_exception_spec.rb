require 'spec_helper'
require 'onlinepayments/sdk/declined_transaction_exception'
require 'onlinepayments/sdk/domain/api_error'

DeclinedTransactionException ||= OnlinePayments::SDK::DeclinedTransactionException

describe DeclinedTransactionException do

  def make_error
    OnlinePayments::SDK::Domain::APIError.new
  end

  describe 'construction without custom message' do
    subject { DeclinedTransactionException.new(402, '{"error":"declined"}', nil, nil) }

    it 'stores status_code' do
      expect(subject.status_code).to eq(402)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('{"error":"declined"}')
    end

    it 'stores nil error_id' do
      expect(subject.error_id).to be_nil
    end

    it 'normalizes nil errors to empty list' do
      expect(subject.errors.size).to eq(0)
    end

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'allows nil response_body' do
      ex = DeclinedTransactionException.new(402, nil, nil, nil)
      expect(ex.response_body).to be_nil
    end

    it 'allows various status codes' do
      ex400 = DeclinedTransactionException.new(400, '{}', nil, nil)
      ex402 = DeclinedTransactionException.new(402, '{}', nil, nil)
      ex500 = DeclinedTransactionException.new(500, '{}', nil, nil)
      expect(ex400.status_code).to eq(400)
      expect(ex402.status_code).to eq(402)
      expect(ex500.status_code).to eq(500)
    end

    it 'stores error_id when provided' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id-123', nil)
      expect(ex.error_id).to eq('error-id-123')
    end

    it 'stores errors when provided' do
      error = make_error
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', [error])
      expect(ex.errors.size).to eq(1)
      expect(ex.errors[0]).to be(error)
    end

    it 'uses default ApiException message' do
      expect(subject.message).to start_with('the payment platform returned an error response')
    end
  end

  describe 'construction with custom message' do
    it 'stores custom message' do
      error = make_error
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id-123', [error], 'Custom error message')
      expect(ex.message).to start_with('Custom error message')
    end

    it 'stores error_id' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id-456', [], 'Custom error message')
      expect(ex.error_id).to eq('error-id-456')
    end

    it 'stores multiple errors' do
      error1 = make_error
      error2 = make_error
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id-789', [error1, error2], 'Custom error message')
      expect(ex.errors.size).to eq(2)
      expect(ex.errors[0]).to be(error1)
      expect(ex.errors[1]).to be(error2)
    end

    it 'stores status_code with message' do
      ex = DeclinedTransactionException.new(403, '{"error":"forbidden"}', 'error-id', nil, 'Custom error message')
      expect(ex.status_code).to eq(403)
    end

    it 'stores response_body with message' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined","details":"payment rejected"}', 'error-id', nil, 'Custom error message')
      expect(ex.response_body).to eq('{"error":"declined","details":"payment rejected"}')
    end

    it 'uses default message when nil is given' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', nil, nil)
      expect(ex.message).to start_with('the payment platform returned an error response')
    end

    it 'allows nil error_id' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', nil, nil, 'Custom error message')
      expect(ex.error_id).to be_nil
    end

    it 'normalizes nil errors to empty list' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', nil, 'Custom error message')
      expect(ex.errors.size).to eq(0)
    end

    it 'allows empty errors list' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', [], 'Custom error message')
      expect(ex.errors.size).to eq(0)
    end

    it 'is an ApiException' do
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', nil, 'Custom error message')
      expect(ex).to be_a(OnlinePayments::SDK::ApiException)
    end
  end

  describe 'comparing different instances' do
    it 'can have different status codes' do
      ex1 = DeclinedTransactionException.new(402, '{}', 'error-1', nil, 'Message 1')
      ex2 = DeclinedTransactionException.new(403, '{}', 'error-2', nil, 'Message 2')
      expect(ex1.status_code).to eq(402)
      expect(ex2.status_code).to eq(403)
    end

    it 'can have different error_ids' do
      ex1 = DeclinedTransactionException.new(402, '{}', 'error-id-1', nil, 'Message 1')
      ex2 = DeclinedTransactionException.new(402, '{}', 'error-id-2', nil, 'Message 2')
      expect(ex1.error_id).to eq('error-id-1')
      expect(ex2.error_id).to eq('error-id-2')
    end

    it 'can have different messages' do
      ex1 = DeclinedTransactionException.new(402, '{}', 'error-id', nil, 'First message')
      ex2 = DeclinedTransactionException.new(402, '{}', 'error-id', nil, 'Second message')
      expect(ex1.message).to start_with('First message')
      expect(ex2.message).to start_with('Second message')
    end
  end

  describe 'message and errors identity' do
    it 'keeps the provided errors object without a custom message' do
      errors = [make_error]
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', errors)
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(the payment platform returned an error response; status_code=402; response_body='{"error":"declined"}'))
    end

    it 'keeps the provided errors object with a custom message' do
      errors = [make_error]
      ex = DeclinedTransactionException.new(402, '{"error":"declined"}', 'error-id', errors, 'Custom error message')
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(Custom error message; status_code=402; response_body='{"error":"declined"}'))
    end
  end

  describe 'inheritance' do
    subject { DeclinedTransactionException.new(402, 'Declined', 'ERR', []) }

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'is a RuntimeError' do
      expect(subject).to be_a(RuntimeError)
    end
  end
end
