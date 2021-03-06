require 'spec_helper'

Obfuscator ||= OnlinePayments::SDK::Logging::Obfuscator
ValueObfuscator ||= OnlinePayments::SDK::Logging::ValueObfuscator

describe Obfuscator do
  subject(:sample) { Obfuscator.new(obsfs, case_insensitive) }
  context 'initialize' do
    let(:obsfs) { { 'k1' => ValueObfuscator.INSTANCE,
                    'k2' => ValueObfuscator.INSTANCE } }

    context 'case sensitive' do
      let(:case_insensitive) { false }
      it 'deep-copies obfuscators' do
        obsfs_copy = sample.instance_variable_get(:@obfuscators)
        obsfs['k2'] = nil
        expect(obsfs_copy).not_to be_nil
      end
    end

    context 'case insensitive' do
      let(:case_insensitive) { true }
      it 'deep-copies obfuscators' do
        obsfs_copy = sample.instance_variable_get(:@obfuscators)
        expect(obsfs_copy['K2']).to equal(obsfs_copy['k2'])
        obsfs['k2'] = nil
        expect(obsfs_copy).not_to be_nil
      end
    end
  end

  context '.obfuscate_value' do
    let(:obsfs) { { 'k1' => ValueObfuscator.INSTANCE } }
    let(:case_insensitive) { false }
    it 'uses the correct obfuscator' do
      str = 'str'

      expect(
        sample.obfuscate_value('k1', str)
      ).to eq('*3')
    end
  end
end
