require 'spec_helper'
require 'onlinepayments/sdk/idempotence_exception'

IdempotenceException ||= OnlinePayments::SDK::IdempotenceException

describe IdempotenceException do

  describe 'construction with default message' do
    subject do
      IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', [], 'idempotence-key', 123_456_789)
    end

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'stores status_code' do
      expect(subject.status_code).to eq(409)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('{"error":"duplicate request"}')
    end

    it 'stores error_id' do
      expect(subject.error_id).to eq('error-id')
    end

    it 'stores errors' do
      expect(subject.errors).to eq([])
    end

    it 'stores idempotence_key' do
      expect(subject.idempotence_key).to eq('idempotence-key')
    end

    it 'stores idempotence_request_timestamp' do
      expect(subject.idempotence_request_timestamp).to eq(123_456_789)
    end

    it 'uses default message' do
      expect(subject.message).to start_with('the payment platform returned a duplicate request error response')
    end

    it 'stores nil idempotence_key' do
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', [], nil, 123_456_789)
      expect(ex.idempotence_key).to be_nil
    end

    it 'stores nil idempotence_request_timestamp' do
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', [], 'idempotence-key', nil)
      expect(ex.idempotence_request_timestamp).to be_nil
    end

    it 'normalizes nil errors to empty list' do
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', nil, 'idempotence-key', 123_456_789)
      expect(ex.errors).not_to be_nil
      expect(ex.errors.size).to eq(0)
    end

    it 'preserves non-empty errors' do
      require 'onlinepayments/sdk/domain/api_error'
      err = OnlinePayments::SDK::Domain::APIError.new
      err.message = 'duplicate request detected'
      errors = [err]
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', errors, 'idempotence-key', 123_456_789)
      expect(ex.errors).to be(errors)
      expect(ex.errors.size).to eq(1)
      expect(ex.errors[0].message).to eq('duplicate request detected')
    end
  end

  describe 'construction with custom message' do
    subject do
      IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', [], 'idempotence-key', 123_456_789, 'custom message')
    end

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'stores status_code' do
      expect(subject.status_code).to eq(409)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('{"error":"duplicate request"}')
    end

    it 'stores error_id' do
      expect(subject.error_id).to eq('error-id')
    end

    it 'stores idempotence_key' do
      expect(subject.idempotence_key).to eq('idempotence-key')
    end

    it 'stores idempotence_request_timestamp' do
      expect(subject.idempotence_request_timestamp).to eq(123_456_789)
    end

    it 'uses custom message' do
      expect(subject.message).to start_with('custom message')
    end

    it 'stores nil idempotence_key' do
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', [], nil, 123_456_789, 'custom message')
      expect(ex.idempotence_key).to be_nil
    end

    it 'stores nil idempotence_request_timestamp' do
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', [], 'idempotence-key', nil, 'custom message')
      expect(ex.idempotence_request_timestamp).to be_nil
    end

    it 'normalizes nil errors to empty list' do
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', nil, 'idempotence-key', 123_456_789, 'custom message')
      expect(ex.errors).not_to be_nil
      expect(ex.errors.size).to eq(0)
    end
  end

  describe 'message and errors identity' do
    it 'keeps the provided errors object with the default message' do
      errors = []
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', errors, 'idempotence-key', 123_456_789)
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(the payment platform returned a duplicate request error response; status_code=409; response_body='{"error":"duplicate request"}'))
    end

    it 'keeps the provided errors object with a custom message' do
      errors = []
      ex = IdempotenceException.new(409, '{"error":"duplicate request"}', 'error-id', errors, 'idempotence-key', 123_456_789, 'custom message')
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(custom message; status_code=409; response_body='{"error":"duplicate request"}'))
    end
  end

  describe 'inheritance' do
    it 'is an ApiException' do
      ex = IdempotenceException.new(409, 'body', 'ERR', [], 'key', 1)
      expect(ex).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'is a RuntimeError' do
      ex = IdempotenceException.new(409, 'body', 'ERR', [], 'key', 1)
      expect(ex).to be_a(RuntimeError)
    end
  end
end
