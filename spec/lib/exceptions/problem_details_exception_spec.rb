require 'spec_helper'
require 'onlinepayments/sdk/problem_details_exception'
require 'onlinepayments/sdk/domain/problem_details_response'

ProblemDetailsException ||= OnlinePayments::SDK::ProblemDetailsException
ProblemDetailsResponse  ||= OnlinePayments::SDK::Domain::ProblemDetailsResponse

describe ProblemDetailsException do

  def build(status_code = 400, response_body = 'body', response = ProblemDetailsResponse.new)
    ProblemDetailsException.new(status_code, response_body, response)
  end

  describe 'construction' do
    it 'stores status_code' do
      ex = build(422)
      expect(ex.status_code).to eq(422)
    end

    it 'stores response_body' do
      ex = build(400, '{"type":"problem"}')
      expect(ex.response_body).to eq('{"type":"problem"}')
    end

    it 'stores the response object' do
      response = ProblemDetailsResponse.new
      ex = ProblemDetailsException.new(400, 'body', response)
      expect(ex.response).to be(response)
    end

    it 'stores nil response_body' do
      ex = build(400, nil)
      expect(ex.response_body).to be_nil
    end

    it 'stores a nil response object' do
      ex = ProblemDetailsException.new(400, 'body', nil)
      expect(ex.response).to be_nil
    end
  end

  describe '#response accessor' do
    it 'returns the response object passed at construction' do
      response = ProblemDetailsResponse.new
      ex = ProblemDetailsException.new(400, 'body', response)
      expect(ex.response).to be(response)
    end
  end

  describe 'message' do
    it 'uses the problem details default message' do
      ex = build
      expect(ex.message).to include('problem details')
    end
  end

  describe 'inheritance' do
    it 'is a ProblemDetailsException' do
      ex = build
      expect(ex).to be_a(ProblemDetailsException)
    end

    it 'inherits from ApiException' do
      ex = build
      expect(ex).to be_a(OnlinePayments::SDK::ApiException)
    end

    it 'inherits from RuntimeError' do
      ex = build
      expect(ex).to be_a(RuntimeError)
    end

    it 'is catchable as ApiException' do
      ex = build(500, 'error')
      expect { raise ex }.to raise_error(OnlinePayments::SDK::ApiException)
    end
  end
end
