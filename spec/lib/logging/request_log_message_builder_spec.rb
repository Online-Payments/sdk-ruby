require 'spec_helper'
require 'uri'
require 'onlinepayments/sdk/logging/request_log_message_builder'

RequestLogMessageBuilder ||= OnlinePayments::SDK::Logging::RequestLogMessageBuilder

describe RequestLogMessageBuilder do

  describe '#initialize' do
    it 'stores request_id, method, and uri' do
      uri = URI.parse('https://example.com/v1/path')
      builder = RequestLogMessageBuilder.new('req-123', 'GET', uri)

      expect(builder.request_id).to eq('req-123')
      expect(builder.instance_variable_get(:@method)).to eq('GET')
      expect(builder.instance_variable_get(:@uri)).to eq(uri)
    end

    it 'uses default obfuscators when not provided' do
      builder = RequestLogMessageBuilder.new('req-1', 'POST', nil)

      expect(builder.body_obfuscator).to be(
        OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator.default_obfuscator
      )
      expect(builder.header_obfuscator).to be(
        OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator.default_obfuscator
      )
    end
  end

  describe '#get_message' do
    context 'without body' do
      it 'formats the message with method and uri but no body section' do
        uri = URI.parse('https://example.com/v1/merchant/123/payments')
        builder = RequestLogMessageBuilder.new('req-abc', 'GET', uri)
        builder.add_headers('X-GCS-ServerMetaInfo', 'meta-value')

        msg = builder.get_message

        expect(msg).to include("requestId='req-abc'")
        expect(msg).to include("method:       'GET'")
        expect(msg).to include("/v1/merchant/123/payments")
        expect(msg).not_to include('content-type:')
        expect(msg).not_to include('body:')
      end

      it 'formats nil method as empty string' do
        uri = URI.parse('https://example.com/v1/path')
        builder = RequestLogMessageBuilder.new('req-1', nil, uri)

        msg = builder.get_message

        expect(msg).to include("method:       ''")
      end
    end

    context 'with body' do
      it 'formats the message including content-type and body' do
        uri = URI.parse('https://example.com/v1/merchant/123/payments')
        builder = RequestLogMessageBuilder.new('req-xyz', 'POST', uri)
        builder.set_body('{"amount":1000}', 'application/json')

        msg = builder.get_message

        expect(msg).to include("requestId='req-xyz'")
        expect(msg).to include("method:       'POST'")
        expect(msg).to include("/v1/merchant/123/payments")
        expect(msg).to include("content-type: 'application/json'")
        expect(msg).to include("body:         '{\"amount\":1000}'")
      end
    end
  end

  describe '#format_uri (private)' do
    it 'returns empty string when uri is nil' do
      builder = RequestLogMessageBuilder.new('req-1', 'GET', nil)
      result = builder.send(:format_uri)
      expect(result).to eq('')
    end

    it 'returns path only when there is no query string' do
      uri = URI.parse('https://example.com/v1/merchant/123')
      builder = RequestLogMessageBuilder.new('req-1', 'GET', uri)
      result = builder.send(:format_uri)
      expect(result).to eq('/v1/merchant/123')
    end

    it 'returns path with query string when query is present' do
      uri = URI.parse('https://example.com/v1/path?amount=100&currency=EUR')
      builder = RequestLogMessageBuilder.new('req-1', 'GET', uri)
      result = builder.send(:format_uri)
      expect(result).to eq('/v1/path?amount=100&currency=EUR')
    end
  end
end
