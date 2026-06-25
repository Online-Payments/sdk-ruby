require 'spec_helper'
require 'onlinepayments/sdk/api_exception'
require 'onlinepayments/sdk/domain/api_error'

ApiException ||= OnlinePayments::SDK::ApiException
APIError      ||= OnlinePayments::SDK::Domain::APIError

describe ApiException do

  def make_error(msg)
    e = APIError.new
    e.message = msg
    e
  end

  describe 'construction (4-param, default message)' do
    it 'stores status_code' do
      ex = ApiException.new(400, 'body', 'err-id', [])
      expect(ex.status_code).to eq(400)
    end

    it 'stores negative status_code' do
      ex = ApiException.new(-1, 'error', 'ERR_001', [])
      expect(ex.status_code).to eq(-1)
    end

    it 'stores zero status_code' do
      ex = ApiException.new(0, 'error', 'ERR_001', [])
      expect(ex.status_code).to eq(0)
    end

    it 'stores response_body' do
      ex = ApiException.new(400, 'Bad Request', 'err-id', [])
      expect(ex.response_body).to eq('Bad Request')
    end

    it 'stores nil response_body' do
      ex = ApiException.new(400, nil, 'err-id', [])
      expect(ex.response_body).to be_nil
    end

    it 'stores empty string response_body' do
      ex = ApiException.new(400, '', 'ERR_001', [])
      expect(ex.response_body).to eq('')
    end

    it 'stores error_id' do
      ex = ApiException.new(400, 'body', 'ERR_400', [])
      expect(ex.error_id).to eq('ERR_400')
    end

    it 'stores nil error_id' do
      ex = ApiException.new(400, 'body', nil, [])
      expect(ex.error_id).to be_nil
    end

    it 'stores empty string error_id' do
      ex = ApiException.new(400, 'error', '', [])
      expect(ex.error_id).to eq('')
    end

    it 'stores errors list' do
      errors = [make_error('Invalid input')]
      ex = ApiException.new(400, 'body', 'err-id', errors)
      expect(ex.errors.size).to eq(1)
      expect(ex.errors.first.message).to eq('Invalid input')
    end

    it 'converts nil errors to empty list' do
      ex = ApiException.new(400, 'body', 'err-id', nil)
      expect(ex.errors).not_to be_nil
      expect(ex.errors).to be_empty
    end

    it 'uses default message' do
      ex = ApiException.new(400, 'body', 'err-id', [])
      expect(ex.message).to start_with('the payment platform returned an error response')
    end
  end

  describe 'construction (5-param, custom message)' do
    it 'uses custom message' do
      ex = ApiException.new(500, 'body', 'err-id', [], 'Custom error')
      expect(ex.message).to start_with('Custom error')
    end

    it 'stores all fields with custom message' do
      errors = [make_error('Resource not found')]
      ex = ApiException.new(404, 'Not Found', 'ERR_404', errors, 'Custom msg')
      expect(ex.message).to start_with('Custom msg')
      expect(ex.status_code).to eq(404)
      expect(ex.response_body).to eq('Not Found')
      expect(ex.error_id).to eq('ERR_404')
      expect(ex.errors.size).to eq(1)
    end

    it 'converts nil errors to empty list' do
      ex = ApiException.new(400, 'body', 'err-id', nil, 'msg')
      expect(ex.errors).to be_empty
    end

    it 'stores nil response_body with custom message' do
      ex = ApiException.new(400, nil, 'ERR_001', [], 'Error')
      expect(ex.response_body).to be_nil
    end

    it 'stores nil error_id with custom message' do
      ex = ApiException.new(400, 'error', nil, [], 'Error')
      expect(ex.error_id).to be_nil
    end

    it 'stores zero status_code with custom message' do
      ex = ApiException.new(0, 'error', 'ERR_001', [], 'Error')
      expect(ex.status_code).to eq(0)
    end

    it 'stores empty string message' do
      ex = ApiException.new(400, 'error', 'ERR_001', [], '')
      expect(ex.message).to start_with('')
    end

    it 'passes nil message → to_s uses class name prefix plus formatted fields' do
      ex = ApiException.new(400, 'error', 'ERR_001', [], nil)
      expect(ex.message).to start_with('OnlinePayments::SDK::ApiException')
      expect(ex.message).to include('status_code=400')
    end
  end

  describe '#status_code accessor' do
    it 'returns positive status_code' do
      ex = ApiException.new(201, 'Created', 'ERR_201', [])
      expect(ex.status_code).to eq(201)
    end

    it 'returns zero status_code' do
      ex = ApiException.new(0, 'error', 'ERR_001', [])
      expect(ex.status_code).to eq(0)
    end

    it 'returns negative status_code' do
      ex = ApiException.new(-1, 'error', 'ERR_001', [])
      expect(ex.status_code).to eq(-1)
    end

    it 'returns status_code from 5-param constructor' do
      ex = ApiException.new(503, 'Service Unavailable', 'ERR_503', [], 'Message')
      expect(ex.status_code).to eq(503)
    end
  end

  describe '#response_body accessor' do
    it 'returns response_body' do
      ex = ApiException.new(400, 'Invalid request format', 'ERR_400', [])
      expect(ex.response_body).to eq('Invalid request format')
    end

    it 'returns nil response_body' do
      ex = ApiException.new(400, nil, 'ERR_400', [])
      expect(ex.response_body).to be_nil
    end

    it 'returns empty response_body' do
      ex = ApiException.new(400, '', 'ERR_400', [])
      expect(ex.response_body).to eq('')
    end
  end

  describe '#error_id accessor' do
    it 'returns error_id' do
      ex = ApiException.new(402, 'Payment required', 'ERR_PAYMENT_FAILED', [])
      expect(ex.error_id).to eq('ERR_PAYMENT_FAILED')
    end

    it 'returns nil error_id' do
      ex = ApiException.new(400, 'error', nil, [])
      expect(ex.error_id).to be_nil
    end

    it 'returns empty error_id' do
      ex = ApiException.new(400, 'error', '', [])
      expect(ex.error_id).to eq('')
    end
  end

  describe '#errors accessor' do
    it 'returns errors list with two entries' do
      errors = [make_error('Error 1'), make_error('Error 2')]
      ex = ApiException.new(400, 'error', 'ERR_400', errors)
      expect(ex.errors.size).to eq(2)
      expect(ex.errors[0].message).to eq('Error 1')
      expect(ex.errors[1].message).to eq('Error 2')
    end

    it 'returns empty list when no errors' do
      ex = ApiException.new(400, 'error', 'ERR_400', [])
      expect(ex.errors).not_to be_nil
      expect(ex.errors).to be_empty
    end

    it 'converts nil to empty list' do
      ex = ApiException.new(400, 'error', 'ERR_400', nil)
      expect(ex.errors).not_to be_nil
      expect(ex.errors.size).to eq(0)
    end

    it 'returns single error' do
      errors = [make_error('Single error')]
      ex = ApiException.new(400, 'error', 'ERR_400', errors)
      expect(ex.errors.size).to eq(1)
      expect(ex.errors[0].message).to eq('Single error')
    end
  end

  describe '#to_s' do
    it 'includes status_code when positive' do
      ex = ApiException.new(400, 'Bad Request', 'ERR_400', [])
      expect(ex.to_s).to include('status_code=400')
    end

    it 'excludes status_code when zero' do
      ex = ApiException.new(0, 'body', 'err-id', [])
      expect(ex.to_s).not_to include('status_code=')
    end

    it 'excludes status_code when negative' do
      ex = ApiException.new(-1, 'body', 'err-id', [])
      expect(ex.to_s).not_to include('status_code=')
    end

    it 'includes response_body when non-empty' do
      ex = ApiException.new(400, 'Invalid input data', 'ERR_400', [])
      expect(ex.to_s).to include("response_body='Invalid input data'")
    end

    it 'excludes response_body when nil' do
      ex = ApiException.new(400, nil, 'ERR_400', [])
      expect(ex.to_s).not_to include('response_body=')
    end

    it 'excludes response_body when empty' do
      ex = ApiException.new(400, '', 'ERR_400', [])
      expect(ex.to_s).not_to include('response_body=')
    end

    it 'includes the default message' do
      ex = ApiException.new(400, 'error', 'ERR_400', [])
      expect(ex.to_s).to include('the payment platform returned an error response')
    end

    it 'includes custom message from 5-param constructor' do
      ex = ApiException.new(500, 'Internal Error', 'ERR_500', [], 'Custom error message')
      expect(ex.to_s).to include('Custom error message')
    end

    it 'formats with status_code and response_body together' do
      ex = ApiException.new(401, 'Unauthorized', 'ERR_401', [])
      expect(ex.to_s).to include('status_code=401')
      expect(ex.to_s).to include("response_body='Unauthorized'")
    end

    it 'formats with status_code only when response_body is empty' do
      ex = ApiException.new(403, '', 'ERR_403', [])
      expect(ex.to_s).to include('status_code=403')
      expect(ex.to_s).not_to include('response_body=')
    end
  end

  describe 'message formatting edge cases' do
    it 'returns the full formatted message when constructed with an empty custom message' do
      ex = ApiException.new(400, 'error', 'ERR_001', [], '')
      expect(ex.message).to eq("; status_code=400; response_body='error'")
      expect(ex.to_s).to eq("; status_code=400; response_body='error'")
    end

    it 'returns the full formatted message when constructed with a nil custom message' do
      ex = ApiException.new(400, 'error', 'ERR_001', [], nil)
      expect(ex.message).to eq("OnlinePayments::SDK::ApiException; status_code=400; response_body='error'")
      expect(ex.to_s).to eq("OnlinePayments::SDK::ApiException; status_code=400; response_body='error'")
    end
  end

  describe 'inheritance' do
    it 'is a RuntimeError' do
      ex = ApiException.new(500, 'error', 'ERR_500', [])
      expect(ex).to be_a(RuntimeError)
    end

    it 'is an Exception' do
      ex = ApiException.new(500, 'error', 'ERR_500', [])
      expect(ex).to be_a(Exception)
    end

    it 'is catchable as RuntimeError' do
      ex = ApiException.new(500, 'error', 'ERR_500', [])
      expect { raise ex }.to raise_error(RuntimeError) { |e|
        expect(e.message).to start_with('the payment platform returned an error response')
      }
    end
  end
end
