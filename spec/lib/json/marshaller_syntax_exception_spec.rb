require 'spec_helper'
require 'onlinepayments/sdk/json/marshaller_syntax_exception'

MarshallerSyntaxException ||= OnlinePayments::SDK::JSON::MarshallerSyntaxException

describe MarshallerSyntaxException do

  describe 'construction' do
    it 'can be raised with a message' do
      expect { raise MarshallerSyntaxException, 'invalid JSON' }
        .to raise_error(MarshallerSyntaxException, 'invalid JSON')
    end

    it 'can be raised with no message' do
      expect { raise MarshallerSyntaxException }.to raise_error(MarshallerSyntaxException)
    end

    it 'can be constructed with a cause' do
      cause = JSON::ParserError.new('unexpected token')
      ex = MarshallerSyntaxException.new('parse failed')
      expect(ex.message).to eq('parse failed')
    end
  end

  describe 'construction with an exception object' do
    it 'uses the exception text as the message without storing a cause' do
      cause = ArgumentError.new('Invalid JSON')
      ex = MarshallerSyntaxException.new(cause)
      expect(ex.message).to eq(cause.to_s)
      expect(ex.cause).to be_nil
    end
  end

  describe 'inheritance' do
    it 'is a RuntimeError' do
      expect(MarshallerSyntaxException.new).to be_a(RuntimeError)
    end

    it 'can be caught as a RuntimeError' do
      expect { raise MarshallerSyntaxException, 'bad json' }
        .to raise_error(RuntimeError)
    end
  end
end
