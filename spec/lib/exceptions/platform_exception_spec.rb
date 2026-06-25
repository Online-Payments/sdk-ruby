require 'spec_helper'
require 'onlinepayments/sdk/platform_exception'
require 'onlinepayments/sdk/domain/api_error'

PlatformException ||= OnlinePayments::SDK::PlatformException

describe PlatformException do

  def make_error(msg)
    e = OnlinePayments::SDK::Domain::APIError.new
    e.message = msg
    e
  end

  describe 'construction with default message' do
    subject { PlatformException.new(500, '{"error":"platform error"}', 'error-id', []) }

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'stores status_code' do
      expect(subject.status_code).to eq(500)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('{"error":"platform error"}')
    end

    it 'stores error_id' do
      expect(subject.error_id).to eq('error-id')
    end

    it 'stores errors' do
      expect(subject.errors).to eq([])
    end

    it 'uses default platform message' do
      expect(subject.message).to start_with('the payment platform returned an error response')
    end

    it 'normalizes nil errors to empty list' do
      ex = PlatformException.new(500, '{"error":"platform error"}', 'error-id', nil)
      expect(ex.errors).not_to be_nil
      expect(ex.errors.size).to eq(0)
    end

    it 'preserves non-empty errors' do
      errors = [make_error('payment failed')]
      ex = PlatformException.new(500, '{"error":"platform error"}', 'error-id', errors)
      expect(ex.errors).to be(errors)
      expect(ex.errors.size).to eq(1)
      expect(ex.errors[0].message).to eq('payment failed')
    end
  end

  describe 'construction with custom message' do
    subject { PlatformException.new(500, '{"error":"platform error"}', 'error-id', [], 'custom message') }

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'stores status_code' do
      expect(subject.status_code).to eq(500)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('{"error":"platform error"}')
    end

    it 'stores error_id' do
      expect(subject.error_id).to eq('error-id')
    end

    it 'uses custom message' do
      expect(subject.message).to start_with('custom message')
    end

    it 'normalizes nil errors to empty list' do
      ex = PlatformException.new(500, '{"error":"platform error"}', 'error-id', nil, 'custom message')
      expect(ex.errors).not_to be_nil
      expect(ex.errors.size).to eq(0)
    end

    it 'preserves non-empty errors' do
      errors = [make_error('payment failed')]
      ex = PlatformException.new(500, '{"error":"platform error"}', 'error-id', errors, 'custom message')
      expect(ex.errors).to be(errors)
      expect(ex.errors.size).to eq(1)
      expect(ex.errors[0].message).to eq('payment failed')
    end
  end

  describe 'message and errors identity' do
    it 'keeps the provided errors object with the default message' do
      errors = []
      ex = PlatformException.new(500, '{"error":"platform error"}', 'error-id', errors)
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(the payment platform returned an error response; status_code=500; response_body='{"error":"platform error"}'))
    end

    it 'keeps the provided errors object with a custom message' do
      errors = []
      ex = PlatformException.new(500, '{"error":"platform error"}', 'error-id', errors, 'custom message')
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(custom message; status_code=500; response_body='{"error":"platform error"}'))
    end
  end

  describe 'inheritance' do
    subject { PlatformException.new(500, 'body', 'ERR', []) }

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'is a RuntimeError' do
      expect(subject).to be_a(RuntimeError)
    end
  end
end
