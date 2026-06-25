require 'spec_helper'
require 'stringio'
require 'onlinepayments/sdk/logging/log_message_builder'
require 'onlinepayments/sdk/logging/obfuscation/body_obfuscator'
require 'onlinepayments/sdk/logging/obfuscation/header_obfuscator'

LogMessageBuilder ||= OnlinePayments::SDK::Logging::LogMessageBuilder
BodyObfuscator    ||= OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator
HeaderObfuscator  ||= OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator

describe LogMessageBuilder do

  let(:body_obf)   { BodyObfuscator.default_obfuscator }
  let(:header_obf) { HeaderObfuscator.default_obfuscator }

  describe 'construction' do
    it 'stores request_id' do
      b = LogMessageBuilder.new('req-001')
      expect(b.request_id).to eq('req-001')
    end

    it 'uses default obfuscators when not provided' do
      b = LogMessageBuilder.new('req-001')
      expect(b.body_obfuscator).to eq(body_obf)
      expect(b.header_obfuscator).to eq(header_obf)
    end

    it 'stores custom body_obfuscator' do
      custom = double('BodyObfuscator')
      b = LogMessageBuilder.new('req-001', custom, header_obf)
      expect(b.body_obfuscator).to eq(custom)
    end

    it 'stores custom header_obfuscator' do
      custom = double('HeaderObfuscator')
      b = LogMessageBuilder.new('req-001', body_obf, custom)
      expect(b.header_obfuscator).to eq(custom)
    end

    it 'raises ArgumentError for nil request_id' do
      expect { LogMessageBuilder.new(nil) }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for empty request_id' do
      expect { LogMessageBuilder.new('') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for nil body_obfuscator' do
      expect { LogMessageBuilder.new('req', nil, header_obf) }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for nil header_obfuscator' do
      expect { LogMessageBuilder.new('req', body_obf, nil) }.to raise_error(ArgumentError)
    end

    it 'initializes headers as empty string' do
      b = LogMessageBuilder.new('req-001')
      expect(b.headers).to eq('')
    end

    it 'initializes body as nil' do
      b = LogMessageBuilder.new('req-001')
      expect(b.body).to be_nil
    end
  end

  describe '#add_headers' do
    subject { LogMessageBuilder.new('req-001') }

    it 'adds first header without leading comma' do
      subject.add_headers('Content-Type', 'application/json')
      expect(subject.headers).to eq('Content-Type="application/json"')
    end

    it 'adds second header with comma separator' do
      subject.add_headers('Content-Type', 'application/json')
      subject.add_headers('X-Request-ID', 'req-123')
      expect(subject.headers).to include('Content-Type="application/json"')
      expect(subject.headers).to include(', X-Request-ID="req-123"')
    end

    it 'handles nil value without error' do
      expect { subject.add_headers('X-Optional', nil) }.not_to raise_error
      expect(subject.headers).to include('X-Optional=""')
    end
  end

  describe '#set_body' do
    subject { LogMessageBuilder.new('req-001') }

    it 'sets body and content_type for text/html' do
      subject.set_body('Hello World', 'text/html')
      expect(subject.body).not_to be_nil
      expect(subject.content_type).to eq('text/html')
    end

    it 'sets body for application/json' do
      subject.set_body('{"key":"value"}', 'application/json')
      expect(subject.content_type).to eq('application/json')
    end

    it 'sets body to <binary content> for binary content type' do
      subject.set_body('binary_data', 'application/octet-stream')
      expect(subject.body).to eq('<binary content>')
    end

    it 'sets body to <binary content> for image type' do
      subject.set_body('img_data', 'image/png')
      expect(subject.body).to eq('<binary content>')
    end

    it 'sets content_type for binary' do
      subject.set_body('data', 'application/pdf')
      expect(subject.content_type).to eq('application/pdf')
    end
  end

  describe '#is_binary' do
    subject { LogMessageBuilder.new('req-001') }

    it 'returns false for nil' do
      expect(subject.is_binary(nil)).to be false
    end

    it 'returns false for text/html' do
      expect(subject.is_binary('text/html')).to be false
    end

    it 'returns false for text/plain' do
      expect(subject.is_binary('text/plain')).to be false
    end

    it 'returns false for application/json' do
      expect(subject.is_binary('application/json')).to be false
    end

    it 'returns false for content types containing xml' do
      expect(subject.is_binary('application/xml')).to be false
    end

    it 'returns true for application/octet-stream' do
      expect(subject.is_binary('application/octet-stream')).to be true
    end

    it 'returns true for image/png' do
      expect(subject.is_binary('image/png')).to be true
    end

    it 'returns true for application/pdf' do
      expect(subject.is_binary('application/pdf')).to be true
    end
  end

  describe '#set_body with StringIO' do
    subject { LogMessageBuilder.new('req-001') }

    it 'treats binary StringIO content as binary content' do
      subject.set_body(StringIO.new('binary_data'), 'application/octet-stream')
      expect(subject.body).to eq('<binary content>')
      expect(subject.content_type).to eq('application/octet-stream')
    end

    it 'raises NoMethodError for text StringIO content' do
      expect {
        subject.set_body(StringIO.new('reader body'), 'text/plain')
      }.to raise_error(NoMethodError, /empty\?/) 
    end
  end

  describe '#get_message' do
    it 'raises NotImplementedError on the base class' do
      b = LogMessageBuilder.new('req-001')
      expect { b.get_message }.to raise_error(NotImplementedError)
    end
  end

  describe '#to_s' do
    it 'on the base class calls super (not get_message)' do
      b = LogMessageBuilder.new('req-001')
      expect { b.to_s }.not_to raise_error
    end

    it 'delegates to get_message on subclasses' do
      subclass = Class.new(LogMessageBuilder) do
        def get_message
          "subclass message for #{request_id}"
        end
      end
      b = subclass.new('req-sub')
      expect(b.to_s).to eq('subclass message for req-sub')
    end
  end

  describe '#empty_if_null (protected)' do
    subject { LogMessageBuilder.new('req-001') }

    it 'returns empty string for nil' do
      expect(subject.send(:empty_if_null, nil)).to eq('')
    end

    it 'returns the value when not nil' do
      expect(subject.send(:empty_if_null, 'hello')).to eq('hello')
    end
  end
end
