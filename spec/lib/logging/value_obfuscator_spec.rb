require 'spec_helper'

include OnlinePayments::SDK::Logging

describe ValueObfuscator do
  it 'cannot be explicitly instantiated' do
    expect { ValueObfuscator.new
    }.to raise_error(NoMethodError)

    expect { ValueObfuscator.private_new
    }.to raise_error(NoMethodError)
  end

  it 'can be initialized correctly' do
    sample = ValueObfuscator.send(:private_new)
    expect(sample.nil?).to eq(false)
  end

  context '.obfuscate_value' do
    subject(:sample) { ValueObfuscator.send(:private_new) }
    let(:value) { 'str' }

    it 'returns nil if value is nil' do
      expect(sample.obfuscate_value(nil)).to be_nil
    end

    it 'returns empty string if value has length 0' do
      expect(sample.obfuscate_value('')).to eq('')
    end
  end
end
