require 'spec_helper'
require 'onlinepayments/sdk/webhooks/secret_key_not_available_exception'

SecretKeyNotAvailableException ||= OnlinePayments::SDK::Webhooks::SecretKeyNotAvailableException
SignatureValidationException   ||= OnlinePayments::SDK::Webhooks::SignatureValidationException

describe SecretKeyNotAvailableException do

  describe 'construction with key_id and message' do
    subject { SecretKeyNotAvailableException.new(key_id: 'api-key-123', message: 'Secret key not found for key: api-key-123') }

    it 'creates the instance' do
      expect(subject).not_to be_nil
    end

    it 'stores the key_id' do
      expect(subject.key_id).to eq('api-key-123')
    end

    it 'stores the message' do
      expect(subject.message).to eq('Secret key not found for key: api-key-123')
    end

    it 'is a RuntimeError' do
      expect(subject).to be_a(RuntimeError)
    end
  end

  describe 'construction with key_id and cause' do
    let(:cause) do
      begin
        raise RuntimeError, 'Database connection failed'
      rescue => e
        e
      end
    end
    subject { SecretKeyNotAvailableException.new(key_id: 'api-key-456', cause: cause) }

    it 'creates the instance' do
      expect(subject).not_to be_nil
    end

    it 'stores the key_id' do
      expect(subject.key_id).to eq('api-key-456')
    end

    it 'stores the cause (via backtrace)' do
      expect(subject.backtrace).to eq(cause.backtrace)
    end

    it 'has access to cause message via cause object' do
      expect(cause.message).to eq('Database connection failed')
    end
  end

  describe 'construction with key_id, message and cause' do
    let(:cause) do
      begin
        raise RuntimeError, 'Connection timeout'
      rescue => e
        e
      end
    end
    subject { SecretKeyNotAvailableException.new(key_id: 'api-key-789', message: 'Could not retrieve secret key for api-key-789', cause: cause) }

    it 'creates the instance' do
      expect(subject).not_to be_nil
    end

    it 'stores the message' do
      expect(subject.message).to eq('Could not retrieve secret key for api-key-789')
    end

    it 'stores the key_id' do
      expect(subject.key_id).to eq('api-key-789')
    end

    it 'stores the cause (via backtrace)' do
      expect(subject.backtrace).to eq(cause.backtrace)
    end

    it 'has complete exception chain info' do
      expect(subject.message).to eq('Could not retrieve secret key for api-key-789')
      expect(subject.key_id).to eq('api-key-789')
      expect(cause.message).to eq('Connection timeout')
    end
  end

  describe '#key_id accessor' do
    it 'returns correct key_id' do
      ex = SecretKeyNotAvailableException.new(key_id: 'production-key-001', message: 'Error')
      expect(ex.key_id).to eq('production-key-001')
    end

    it 'returns same key_id as stored in constructor' do
      original_key_id = 'webhook-secret-xyz'
      ex = SecretKeyNotAvailableException.new(key_id: original_key_id, message: 'Message')
      expect(ex.key_id).to eq(original_key_id)
    end

    it 'returns different key_ids for different instances' do
      ex1 = SecretKeyNotAvailableException.new(key_id: 'key-1', message: 'Error')
      ex2 = SecretKeyNotAvailableException.new(key_id: 'key-2', message: 'Error')
      expect(ex1.key_id).to eq('key-1')
      expect(ex2.key_id).to eq('key-2')
    end

    it 'raises ArgumentError when key_id is nil' do
      expect { SecretKeyNotAvailableException.new(key_id: nil, message: 'Error') }.to raise_error(ArgumentError)
    end
  end

  describe 'throwing and catching' do
    it 'is throwable and catchable as itself' do
      key_id = 'test-key'
      expect {
        raise SecretKeyNotAvailableException.new(key_id: key_id, message: 'Key not found')
      }.to raise_error(SecretKeyNotAvailableException) { |e|
        expect(e.key_id).to eq(key_id)
      }
    end

    it 'is catchable as SignatureValidationException' do
      expect {
        raise SecretKeyNotAvailableException.new(key_id: 'test-key', message: 'Key not found')
      }.to raise_error(SignatureValidationException) { |e|
        expect(e).to be_a(SecretKeyNotAvailableException)
      }
    end

    it 'is catchable as RuntimeError' do
      expect {
        raise SecretKeyNotAvailableException.new(key_id: 'test-key', message: 'Key not found')
      }.to raise_error(RuntimeError) { |e|
        expect(e).to be_a(SecretKeyNotAvailableException)
      }
    end
  end

  describe 'key_id formats' do
    it 'handles simple key ids' do
      ex = SecretKeyNotAvailableException.new(key_id: 'key1', message: 'Error')
      expect(ex.key_id).to eq('key1')
    end

    it 'handles key ids with hyphens' do
      ex = SecretKeyNotAvailableException.new(key_id: 'api-key-prod-001', message: 'Error')
      expect(ex.key_id).to eq('api-key-prod-001')
    end

    it 'handles key ids with underscores' do
      ex = SecretKeyNotAvailableException.new(key_id: 'api_key_prod_001', message: 'Error')
      expect(ex.key_id).to eq('api_key_prod_001')
    end

    it 'handles key ids with numbers' do
      ex = SecretKeyNotAvailableException.new(key_id: 'key123456789', message: 'Error')
      expect(ex.key_id).to eq('key123456789')
    end

    it 'handles UUID-style key ids' do
      ex = SecretKeyNotAvailableException.new(key_id: '550e8400-e29b-41d4-a716-446655440000', message: 'Error')
      expect(ex.key_id).to eq('550e8400-e29b-41d4-a716-446655440000')
    end
  end

  describe 'construction without key_id raises ArgumentError' do
    it 'raises ArgumentError when key_id is missing' do
      expect { SecretKeyNotAvailableException.new(message: 'no key') }
        .to raise_error(ArgumentError)
    end

    it 'raises ArgumentError when key_id is nil' do
      expect { SecretKeyNotAvailableException.new(key_id: nil, message: 'no key') }
        .to raise_error(ArgumentError)
    end
  end

  describe 'cause handling' do
    it 'derives the message from the cause without storing the cause object' do
      cause = RuntimeError.new('Database error occurred')
      ex = SecretKeyNotAvailableException.new(key_id: 'api-key-456', cause: cause)
      expect(ex.message).to eq('Database error occurred')
      expect(ex.key_id).to eq('api-key-456')
      expect(ex.cause).to be_nil
    end

    it 'keeps a custom message without storing the cause object' do
      cause = RuntimeError.new('Connection timeout')
      ex = SecretKeyNotAvailableException.new(key_id: 'api-key-789', message: 'Could not retrieve secret key for api-key-789', cause: cause)
      expect(ex.message).to eq('Could not retrieve secret key for api-key-789')
      expect(ex.key_id).to eq('api-key-789')
      expect(ex.cause).to be_nil
    end
  end

  describe 'inheritance' do
    it 'is a SignatureValidationException' do
      ex = SecretKeyNotAvailableException.new(key_id: 'k1', message: 'err')
      expect(ex).to be_a(SignatureValidationException)
    end

    it 'is a RuntimeError' do
      ex = SecretKeyNotAvailableException.new(key_id: 'k1', message: 'err')
      expect(ex).to be_a(RuntimeError)
    end
  end
end
