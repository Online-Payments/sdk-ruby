require 'spec_helper'
require 'onlinepayments/sdk/communication/not_found_exception'

NotFoundException ||= OnlinePayments::SDK::Communication::NotFoundException

describe NotFoundException do

  describe 'construction with cause only' do
    let(:cause) { RuntimeError.new('original error') }
    subject { NotFoundException.new(cause) }

    it 'stores the cause' do
      expect(subject.cause).to eq(cause)
    end

    it 'derives message from cause.to_s' do
      expect(subject.message).to eq('original error')
    end
  end

  describe 'construction with cause and message' do
    let(:cause) { RuntimeError.new('original error') }
    subject { NotFoundException.new(cause, 'Resource not found') }

    it 'stores the cause' do
      expect(subject.cause).to eq(cause)
    end

    it 'stores the message' do
      expect(subject.message).to eq('Resource not found')
    end
  end

  describe 'cause is mutable' do
    it 'allows updating the cause via attr_accessor' do
      cause1 = RuntimeError.new('first')
      cause2 = RuntimeError.new('second')
      ex = NotFoundException.new(cause1)
      ex.cause = cause2
      expect(ex.cause).to eq(cause2)
    end
  end

  describe 'construction with ArgumentError cause' do
    let(:cause) { ArgumentError.new('Invalid path parameter') }

    it 'stores the exact cause object and derives the message from it' do
      ex = NotFoundException.new(cause)
      expect(ex.cause).to be(cause)
      expect(ex.message).to eq(cause.to_s)
    end

    it 'stores the exact cause object when an explicit message is given' do
      ex = NotFoundException.new(cause, 'Resource not found')
      expect(ex.cause).to be(cause)
      expect(ex.message).to eq('Resource not found')
    end
  end

  describe 'inheritance' do
    it 'is a RuntimeError' do
      expect(NotFoundException.new(nil)).to be_a(RuntimeError)
    end
  end
end
