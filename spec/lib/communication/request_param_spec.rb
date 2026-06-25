require 'spec_helper'
require 'onlinepayments/sdk/communication/request_param'

RequestParam ||= OnlinePayments::SDK::Communication::RequestParam

describe RequestParam do

  describe 'construction' do
    it 'stores name and value' do
      p = RequestParam.new('page', '1')
      expect(p.name).to eq('page')
      expect(p.value).to eq('1')
    end

    it 'raises ArgumentError for nil name' do
      expect { RequestParam.new(nil, 'value') }.to raise_error(ArgumentError, /name is required/)
    end

    it 'raises ArgumentError for blank name' do
      expect { RequestParam.new('   ', 'value') }.to raise_error(ArgumentError, /name is required/)
    end

    it 'accepts nil value' do
      p = RequestParam.new('filter', nil)
      expect(p.name).to eq('filter')
      expect(p.value).to be_nil
    end

    it 'accepts empty string value' do
      p = RequestParam.new('q', '')
      expect(p.value).to eq('')
    end

    it 'accepts numeric-looking value as string' do
      p = RequestParam.new('limit', '100')
      expect(p.value).to eq('100')
    end
  end

  describe '#to_s' do
    it 'returns name=value format' do
      p = RequestParam.new('currency', 'EUR')
      expect(p.to_s).to eq('currency=EUR')
    end

    it 'returns name=nil format when value is nil' do
      p = RequestParam.new('filter', nil)
      expect(p.to_s).to eq('filter=')
    end
  end
end
