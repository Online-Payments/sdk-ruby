require 'spec_helper'
require 'onlinepayments/sdk/logging/response_log_message_builder'
require 'onlinepayments/sdk/logging/obfuscation/body_obfuscator'
require 'onlinepayments/sdk/logging/obfuscation/header_obfuscator'

ResponseLogMessageBuilder ||= OnlinePayments::SDK::Logging::ResponseLogMessageBuilder
BodyObfuscator            ||= OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator
HeaderObfuscator          ||= OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator

describe ResponseLogMessageBuilder do

  let(:body_obf)   { BodyObfuscator.default_obfuscator }
  let(:header_obf) { HeaderObfuscator.default_obfuscator }

  describe 'construction without duration' do
    it 'creates instance with request_id and status_code' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200)
      expect(builder).not_to be_nil
    end

    it 'creates instance with 404 status code' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 404)
      builder.set_body('Not found', 'text/plain')
      expect(builder.get_message).not_to include('ms)')
    end
  end

  describe 'construction with duration' do
    it 'creates instance with zero duration' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200, 0)
      expect(builder).not_to be_nil
    end

    it 'creates instance with positive duration' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200, 150)
      expect(builder).not_to be_nil
    end

    it 'creates instance with large duration' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200, 5000)
      expect(builder).not_to be_nil
    end
  end

  describe '#get_message without duration' do
    subject { ResponseLogMessageBuilder.new('test-request-id', 200) }

    it 'excludes duration when not provided' do
      subject.set_body('Response body', 'application/json')
      expect(subject.get_message).not_to include('ms)')
    end

    it 'includes requestId in message' do
      expect(subject.get_message).to include("requestId='test-request-id'")
    end

    it 'includes status code in message' do
      expect(subject.get_message).to include('200')
    end

    it 'includes Incoming response label' do
      expect(subject.get_message).to include("Incoming response (requestId='test-request-id')")
    end

    it 'includes content-type in message' do
      subject.set_body('Not found', 'application/json')
      expect(subject.get_message).to include('content-type:')
    end

    it 'includes body in message' do
      subject.set_body('Not found', 'text/plain')
      expect(subject.get_message).to include('body:')
    end

    it 'includes status code and headers fields' do
      subject.add_headers('Content-Type', 'application/json')
      subject.set_body('Not found', 'application/json')
      message = subject.get_message
      expect(message).to include('404') if subject.instance_variable_get(:@status_code) == 404
      expect(message).to include('Content-Type')
    end

    it 'handles nil body and content type' do
      message = subject.get_message
      expect(message).to include('status-code:')
      expect(message).to include('content-type:')
      expect(message).to include('body:')
    end

    it 'uses multiline format' do
      subject.add_headers('Content-Type', 'application/json')
      subject.set_body('{ "key": "value" }', 'application/json')
      message = subject.get_message
      expect(message).to include("\n")
      expect(message).to include('Incoming response')
      expect(message).to include('status-code')
      expect(message).to include('headers')
      expect(message).to include('content-type')
      expect(message).to include('body')
    end
  end

  describe '#get_message with duration' do
    it 'includes duration when positive' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200, 100)
      builder.set_body('Success', 'text/plain')
      expect(builder.get_message).to include("requestId='test-request-id'")
      expect(builder.get_message).to include('ms')
    end

    it 'includes duration when zero' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200, 0)
      builder.set_body('Success', 'text/plain')
      expect(builder.get_message).to include('ms')
    end

    it 'includes duration with large values' do
      builder = ResponseLogMessageBuilder.new('test-request-id', 200, 5000)
      builder.set_body('Success', 'text/plain')
      expect(builder.get_message).to include('5000')
      expect(builder.get_message).to include('ms')
    end

    it 'includes status code alongside duration' do
      builder = ResponseLogMessageBuilder.new('test-id', 500, 250)
      builder.set_body('Server error', 'text/plain')
      message = builder.get_message
      expect(message).to include('500')
      expect(message).to include('250')
      expect(message).to include('ms')
    end
  end

  describe 'message formatting' do
    subject { ResponseLogMessageBuilder.new('test-id', 200) }

    it 'includes all added headers' do
      subject.add_headers('Content-Type', 'application/json')
      subject.add_headers('X-Custom-Header', 'custom-value')
      subject.add_headers('Cache-Control', 'no-cache')
      subject.set_body('Response', 'application/json')
      message = subject.get_message
      expect(message).to include('Content-Type')
      expect(message).to include('X-Custom-Header')
      expect(message).to include('Cache-Control')
    end

    it 'obfuscates the Authorization header' do
      subject.add_headers('Authorization', 'Bearer secret-token-12345')
      subject.set_body('Response', 'application/json')
      message = subject.get_message
      expect(message).to include('Authorization')
      expect(message).to include('*')
    end

    it 'includes content-type in message' do
      subject.set_body('Response body', 'application/xml')
      expect(subject.get_message).to include("content-type: 'application/xml'")
    end

    it 'includes body in message' do
      subject.set_body('Response body content', 'text/plain')
      expect(subject.get_message).to include('Response body content')
    end

    it 'handles different success status codes' do
      [200, 201, 204, 301].each do |code|
        builder = ResponseLogMessageBuilder.new('test-id', code)
        builder.set_body('body', 'text/plain')
        expect(builder.get_message).to include(code.to_s)
      end
    end

    it 'handles error status codes' do
      [400, 404, 500].each do |code|
        builder = ResponseLogMessageBuilder.new('test-id', code)
        builder.set_body('error', 'application/json')
        expect(builder.get_message).to include(code.to_s)
      end
    end
  end
end
