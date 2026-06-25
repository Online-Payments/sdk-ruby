require 'spec_helper'
require 'onlinepayments/sdk/validation_exception'

ValidationException ||= OnlinePayments::SDK::ValidationException

describe ValidationException do

  describe 'construction with default message' do
    subject { ValidationException.new(400, 'body', 'ERR_400', []) }

    it 'stores status_code' do
      expect(subject.status_code).to eq(400)
    end

    it 'stores response_body' do
      expect(subject.response_body).to eq('body')
    end

    it 'stores error_id' do
      expect(subject.error_id).to eq('ERR_400')
    end

    it 'uses default validation message' do
      expect(subject.message).to start_with('the payment platform returned an incorrect request error response')
    end
  end

  describe 'construction with custom message' do
    it 'uses the custom message' do
      ex = ValidationException.new(400, 'body', 'ERR_400', [], 'Custom')
      expect(ex.message).to start_with('Custom')
    end
  end

  describe 'with nil errors' do
    it 'converts nil errors to empty list' do
      ex = ValidationException.new(400, 'body', 'ERR', nil)
      expect(ex.errors).to be_empty
    end
  end

  describe 'message and errors identity' do
    it 'keeps the provided errors object with the default message' do
      errors = []
      ex = ValidationException.new(400, '{"error":"bad request"}', 'error-id', errors)
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(the payment platform returned an incorrect request error response; status_code=400; response_body='{"error":"bad request"}'))
    end

    it 'keeps the provided errors object with a custom message' do
      errors = []
      ex = ValidationException.new(400, '{"error":"bad request"}', 'error-id', errors, 'custom message')
      expect(ex.errors).to be(errors)
      expect(ex.message).to eq(%q(custom message; status_code=400; response_body='{"error":"bad request"}'))
    end
  end

  describe 'inheritance' do
    subject { ValidationException.new(400, 'body', 'ERR', []) }

    it 'is an ApiException' do
      expect(subject).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'is a RuntimeError' do
      expect(subject).to be_a(RuntimeError)
    end
  end
end
