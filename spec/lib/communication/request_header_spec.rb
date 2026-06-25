require 'spec_helper'
require 'onlinepayments/sdk/communication/request_header'

RequestHeader ||= OnlinePayments::SDK::Communication::RequestHeader

describe RequestHeader do

  describe 'construction' do
    it 'stores name and value' do
      h = RequestHeader.new('Content-Type', 'application/json')
      expect(h.name).to eq('Content-Type')
      expect(h.value).to eq('application/json')
    end

    it 'raises ArgumentError for nil name' do
      expect { RequestHeader.new(nil, 'value') }.to raise_error(ArgumentError, /name is required/)
    end

    it 'raises ArgumentError for blank name' do
      expect { RequestHeader.new('   ', 'value') }.to raise_error(ArgumentError, /name is required/)
    end

    it 'accepts nil value' do
      h = RequestHeader.new('X-Custom', nil)
      expect(h.value).to be_nil
    end

    it 'accepts empty value without normalizing' do
      h = RequestHeader.new('X-Custom', '')
      expect(h.value).to eq('')
    end
  end

  describe 'value normalization' do
    it 'collapses linebreak followed by spaces into a single space' do
      h = RequestHeader.new('X-Long', "first\n  second")
      expect(h.value).to eq('first second')
    end

    it 'collapses CRLF followed by spaces into a single space' do
      h = RequestHeader.new('X-Long', "first\r\n  second")
      expect(h.value).to eq('first second')
    end

    it 'collapses multiple linebreaks' do
      h = RequestHeader.new('X-Multi', "a\n  b\n  c")
      expect(h.value).to eq('a b c')
    end

    it 'leaves values without linebreaks unchanged' do
      h = RequestHeader.new('X-Normal', 'normal value')
      expect(h.value).to eq('normal value')
    end
  end

  describe '#to_s' do
    it 'returns name:value format' do
      h = RequestHeader.new('Accept', 'application/json')
      expect(h.to_s).to eq('Accept:application/json')
    end
  end

  describe '.get_header' do
    let(:headers) do
      [
        RequestHeader.new('Content-Type', 'application/json'),
        RequestHeader.new('X-Request-ID', 'req-123')
      ]
    end

    it 'returns the header for an exact name match' do
      result = RequestHeader.get_header(headers, 'Content-Type')
      expect(result).not_to be_nil
      expect(result.name).to eq('Content-Type')
    end

    it 'returns nil for an empty headers list' do
      expect(RequestHeader.get_header([], 'Content-Type')).to be_nil
    end

    it 'is case-SENSITIVE — does NOT find header with different casing' do
      result = RequestHeader.get_header(headers, 'content-type')
      expect(result).to be_nil
    end

    it 'returns nil when header name is not in the list' do
      expect(RequestHeader.get_header(headers, 'Authorization')).to be_nil
    end
  end

  describe '.get_header_value' do
    let(:headers) { [RequestHeader.new('Content-Type', 'application/json')] }

    it 'returns the header value for a matching name' do
      expect(RequestHeader.get_header_value(headers, 'Content-Type')).to eq('application/json')
    end

    it 'returns nil when header is not found' do
      expect(RequestHeader.get_header_value(headers, 'X-Missing')).to be_nil
    end

    it 'returns nil for wrong case header name' do
      expect(RequestHeader.get_header_value(headers, 'content-type')).to be_nil
    end
  end
end
