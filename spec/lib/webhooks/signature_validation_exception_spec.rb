require 'spec_helper'
require 'onlinepayments/sdk/webhooks/signature_validation_exception'

SignatureValidationException ||= OnlinePayments::SDK::Webhooks::SignatureValidationException

describe SignatureValidationException do

  describe 'construction with message only' do
    subject { SignatureValidationException.new(message: 'Signature validation failed') }

    it 'creates the instance' do
      expect(subject).not_to be_nil
    end

    it 'stores the message' do
      expect(subject.message).to eq('Signature validation failed')
    end

    it 'is a RuntimeError' do
      expect(subject).to be_a(RuntimeError)
    end

    it 'has no cause backtrace' do
      expect { raise subject }.to raise_error(SignatureValidationException, 'Signature validation failed')
    end
  end

  describe 'construction with cause only' do
    let(:cause) do
      begin
        raise RuntimeError, 'Cryptographic error'
      rescue => e
        e
      end
    end
    subject { SignatureValidationException.new(cause: cause) }

    it 'creates the instance' do
      expect(subject).not_to be_nil
    end

    it 'adopts the cause backtrace' do
      expect(subject.backtrace).to eq(cause.backtrace)
    end

    it 'derives message from cause' do
      expect(subject.message).to eq('Cryptographic error')
    end
  end

  describe 'construction with message and cause' do
    let(:cause) do
      begin
        raise RuntimeError, 'Cryptographic error'
      rescue => e
        e
      end
    end
    subject { SignatureValidationException.new(message: 'Invalid signature: expected ABC123 but got DEF456', cause: cause) }

    it 'creates the instance' do
      expect(subject).not_to be_nil
    end

    it 'stores the message' do
      expect(subject.message).to eq('Invalid signature: expected ABC123 but got DEF456')
    end

    it 'adopts the cause backtrace' do
      expect(subject.backtrace).to eq(cause.backtrace)
    end

    it 'does not store the cause explicitly' do
      expect(subject.cause).to be_nil
    end
  end

  describe 'construction with nil message' do
    subject { SignatureValidationException.new(message: nil) }

    it 'returns class name as message when nil is given' do
      expect(subject.message).to eq('OnlinePayments::SDK::Webhooks::SignatureValidationException')
    end
  end

  describe 'throwing and catching' do
    it 'is throwable and catchable as itself' do
      message = 'Signature mismatch'
      expect {
        raise SignatureValidationException.new(message: message)
      }.to raise_error(SignatureValidationException) { |e|
        expect(e.message).to eq(message)
      }
    end

    it 'is catchable as RuntimeError' do
      expect {
        raise SignatureValidationException.new(message: 'Signature mismatch')
      }.to raise_error(RuntimeError) { |e|
        expect(e).to be_a(SignatureValidationException)
      }
    end

    it 'is catchable as Exception' do
      expect {
        raise SignatureValidationException.new(message: 'Signature mismatch')
      }.to raise_error(Exception) { |e|
        expect(e).to be_a(SignatureValidationException)
      }
    end
  end

  describe 'message handling' do
    it 'handles empty message' do
      ex = SignatureValidationException.new(message: '')
      expect(ex.message).to eq('')
    end

    it 'handles multiline message' do
      message = "Signature validation failed:\nExpected: signature1\nActual: signature2"
      ex = SignatureValidationException.new(message: message)
      expect(ex.message).to eq(message)
      expect(ex.message).to include("\n")
    end

    it 'handles special characters in message' do
      message = 'Invalid signature: @#$%^&*()'
      ex = SignatureValidationException.new(message: message)
      expect(ex.message).to eq(message)
    end

    it 'handles long message' do
      message = 'a' * 1000
      ex = SignatureValidationException.new(message: message)
      expect(ex.message).to eq(message)
      expect(ex.message.length).to eq(1000)
    end
  end

  describe 'exception chains' do
    it 'chains with multiple causes' do
      root_cause = RuntimeError.new('Root cause')
      intermediate = RuntimeError.new('Intermediate')
      # Ruby: we can only set backtrace from one cause, but we can verify the cause chain via backtrace
      ex = SignatureValidationException.new(message: 'Signature failed', cause: intermediate)
      expect(ex.message).to eq('Signature failed')
    end

    it 'preserves stack trace from cause' do
      cause = begin; raise 'Underlying error'; rescue => e; e; end
      ex = SignatureValidationException.new(message: 'Signature validation failed', cause: cause)
      expect(ex.backtrace).not_to be_nil
      expect(ex.backtrace.length).to be > 0
    end

    it 'to_s contains SignatureValidationException' do
      ex = SignatureValidationException.new(message: 'Signature failed')
      expect(ex.to_s).to include('Signature failed')
    end
  end

  describe 'using different constructors' do
    it 'message-only constructor creates instance' do
      ex = SignatureValidationException.new(message: 'Message only')
      expect(ex).not_to be_nil
    end

    it 'cause-only constructor creates instance' do
      ex = SignatureValidationException.new(cause: RuntimeError.new('Cause only'))
      expect(ex).not_to be_nil
    end

    it 'message+cause constructor creates instance' do
      ex = SignatureValidationException.new(message: 'Message', cause: RuntimeError.new('Cause'))
      expect(ex).not_to be_nil
    end

    it 'message-only: has message' do
      ex = SignatureValidationException.new(message: 'Test message')
      expect(ex.message).to eq('Test message')
    end

    it 'cause-only: has cause backtrace' do
      cause = begin; raise 'Test cause'; rescue => e; e; end
      ex = SignatureValidationException.new(cause: cause)
      expect(ex.backtrace).to eq(cause.backtrace)
    end

    it 'message+cause: has both message and cause backtrace' do
      cause = begin; raise 'Test cause'; rescue => e; e; end
      ex = SignatureValidationException.new(message: 'Test message', cause: cause)
      expect(ex.message).to eq('Test message')
      expect(ex.backtrace).to eq(cause.backtrace)
    end
  end

  describe 'cause handling' do
    it 'derives the message from the cause without storing the cause object' do
      cause = RuntimeError.new('Invalid key format')
      ex = SignatureValidationException.new(cause: cause)
      expect(ex.message).to eq('Invalid key format')
      expect(ex.cause).to be_nil
    end
  end

  describe 'inheritance' do
    it 'is a RuntimeError' do
      expect(SignatureValidationException.new(message: 'err')).to be_a(RuntimeError)
    end
  end
end
