require 'spec_helper'
require 'onlinepayments/sdk/communication/response_exception'
require 'onlinepayments/sdk/communication/response_header'

ResponseException ||= OnlinePayments::SDK::Communication::ResponseException
ResponseHeader    ||= OnlinePayments::SDK::Communication::ResponseHeader

describe ResponseException do

  def make_header(name, value)
    ResponseHeader.new(name, value)
  end

  describe 'construction with no headers' do
    subject { ResponseException.new(400, [], 'error body') }

    it 'stores status_code' do
      expect(subject.status_code).to eq(400)
    end

    it 'stores body' do
      expect(subject.body).to eq('error body')
    end

    it 'has empty headers' do
      expect(subject.headers).to be_empty
    end

    it 'uses fixed internal message' do
      expect(subject.message).to start_with('the Online Payments platform returned an error response')
    end
  end

  describe 'construction with nil headers' do
    subject { ResponseException.new(400, nil, 'body') }

    it 'has empty headers array' do
      expect(subject.headers).to eq([])
    end
  end

  describe 'construction with headers' do
    let(:headers) { [make_header('Content-Type', 'application/json'), make_header('X-Request-ID', 'req-123')] }
    subject { ResponseException.new(200, headers, 'body') }

    it 'stores headers as an Array' do
      expect(subject.headers).to be_an(Array)
      expect(subject.headers.length).to eq(2)
    end

    it 'stores ResponseHeader objects in the array' do
      expect(subject.headers[0]).to be_a(ResponseHeader)
      expect(subject.headers[0].name).to eq('Content-Type')
      expect(subject.headers[0].value).to eq('application/json')
    end

    it 'freezes the headers array' do
      expect(subject.headers).to be_frozen
    end
  end

  describe '#to_s' do
    it 'includes status_code when positive' do
      ex = ResponseException.new(400, [], 'body')
      expect(ex.to_s).to include('status_code=400')
    end

    it 'excludes status_code when zero' do
      ex = ResponseException.new(0, [], 'body')
      expect(ex.to_s).not_to include('status_code=')
    end

    it 'includes response_body when non-empty' do
      ex = ResponseException.new(404, [], '{"error":"not found"}')
      expect(ex.to_s).to include("response_body='{\"error\":\"not found\"}'")
    end

    it 'excludes response_body when nil' do
      ex = ResponseException.new(400, [], nil)
      expect(ex.to_s).not_to include('response_body=')
    end

    it 'excludes response_body when empty' do
      ex = ResponseException.new(400, [], '')
      expect(ex.to_s).not_to include('response_body=')
    end

    it 'does not include class name in to_s' do
      ex = ResponseException.new(404, [], '{"error":"not found"}')
      expect(ex.to_s).not_to include('ResponseException')
    end
  end

  describe '#get_header on empty headers' do
    subject { ResponseException.new(400, [], 'body') }

    it 'returns nil when no headers present' do
      expect(subject.get_header('Content-Type')).to be_nil
    end

    it 'returns nil value when no headers present' do
      expect(subject.get_header_value('Content-Type')).to be_nil
    end
  end

  describe '#get_header with non-empty headers' do
    let(:headers) { [make_header('Content-Type', 'application/json')] }
    subject { ResponseException.new(400, headers, 'body') }

    it 'finds an existing header by name' do
      expect(subject.get_header('Content-Type')).not_to be_nil
    end

    it 'returns the header value for an existing header' do
      expect(subject.get_header_value('Content-Type')).to eq('application/json')
    end
  end

  describe 'exact contracts' do
    let(:headers) do
      [
        make_header('Content-Type', 'application/json'),
        make_header('X-Request-Id', 'request-id')
      ]
    end

    subject { ResponseException.new(404, headers, '{"error":"not found"}') }

    it 'returns a duplicated frozen headers array with the same values' do
      expect(subject.body).to eq('{"error":"not found"}')
      expect(subject.headers.length).to eq(2)
      expect(subject.headers[0].name).to eq('Content-Type')
      expect(subject.headers[0].value).to eq('application/json')
      expect(subject.headers[1].name).to eq('X-Request-Id')
      expect(subject.headers[1].value).to eq('request-id')
      expect(subject.headers).not_to be(headers)
      expect(subject.headers).to be_frozen
    end

    it 'returns the full formatted string representation' do
      expect(subject.to_s).to eq(%q(the Online Payments platform returned an error response; status_code=404; response_body='{"error":"not found"}'))
    end
  end

  describe 'inheritance' do
    it 'is a RuntimeError' do
      expect(ResponseException.new(400, [], 'body')).to be_a(RuntimeError)
    end
  end
end
