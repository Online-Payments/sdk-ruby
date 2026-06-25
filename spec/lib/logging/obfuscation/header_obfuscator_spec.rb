require 'spec_helper'

HeaderObfuscator = OnlinePayments::SDK::Logging::Obfuscation::HeaderObfuscator
Obfuscation = OnlinePayments::SDK::Logging::Obfuscation

describe HeaderObfuscator do
  describe '.default_obfuscator' do
    it 'returns a singleton instance' do
      expect(HeaderObfuscator.default_obfuscator).to be_a(HeaderObfuscator)
      expect(HeaderObfuscator.default_obfuscator).to be(HeaderObfuscator.default_obfuscator)
    end
  end

  context '.obfuscate_header()' do
    it 'works when there is a match' do
      expect(HeaderObfuscator.default_obfuscator.obfuscate_header('Authorization', 'Basic QWxhZGRpbjpPcGVuU2VzYW1l')).to eq('********')
      expect(HeaderObfuscator.default_obfuscator.obfuscate_header('authorization', 'Basic QWxhZGRpbjpPcGVuU2VzYW1l')).to eq('********')
      expect(HeaderObfuscator.default_obfuscator.obfuscate_header('AUTHORIZATION', 'Basic QWxhZGRpbjpPcGVuU2VzYW1l')).to eq('********')
    end

    it 'works when there is no match' do
      expect(HeaderObfuscator.default_obfuscator.obfuscate_header('Content-Type', 'application/json')).to eq('application/json')
      expect(HeaderObfuscator.default_obfuscator.obfuscate_header('content-type', 'application/json')).to eq('application/json')
      expect(HeaderObfuscator.default_obfuscator.obfuscate_header('CONTENT-TYPE', 'application/json')).to eq('application/json')
    end

    it 'works with a custom rule' do
      header_obfuscator = HeaderObfuscator.new(additional_rules={
        'content-type' => Obfuscation.obfuscate_all
      })

      expect(header_obfuscator.obfuscate_header('Authorization', 'Basic QWxhZGRpbjpPcGVuU2VzYW1l')).to eq('********')
      expect(header_obfuscator.obfuscate_header('authorization', 'Basic QWxhZGRpbjpPcGVuU2VzYW1l')).to eq('********')
      expect(header_obfuscator.obfuscate_header('AUTHORIZATION', 'Basic QWxhZGRpbjpPcGVuU2VzYW1l')).to eq('********')
      expect(header_obfuscator.obfuscate_header('Content-Type', 'application/json')).to eq('****************')
      expect(header_obfuscator.obfuscate_header('content-type', 'application/json')).to eq('****************')
      expect(header_obfuscator.obfuscate_header('CONTENT-TYPE', 'application/json')).to eq('****************')
    end

    it 'supports multiple custom mask rules in one obfuscator' do
      header_obfuscator = HeaderObfuscator.new(additional_rules={
        'x-token' => Obfuscation.obfuscate_with_fixed_length(4),
        'x-prefix' => Obfuscation.obfuscate_all_but_first(3),
        'x-suffix' => Obfuscation.obfuscate_all_but_last(3)
      })

      expect(header_obfuscator.obfuscate_header('X-Token', 'secret123')).to eq('****')
      expect(header_obfuscator.obfuscate_header('x-prefix', 'secret123')).to eq('sec******')
      expect(header_obfuscator.obfuscate_header('X-SUFFIX', 'secret123')).to eq('******123')
    end

    it 'handles nil and empty values according to each custom rule' do
      header_obfuscator = HeaderObfuscator.new(additional_rules={
        'x-all' => Obfuscation.obfuscate_all,
        'x-fixed' => Obfuscation.obfuscate_with_fixed_length(4),
        'x-first' => Obfuscation.obfuscate_all_but_first(3),
        'x-last' => Obfuscation.obfuscate_all_but_last(3)
      })

      expect(header_obfuscator.obfuscate_header('x-all', nil)).to be_nil
      expect(header_obfuscator.obfuscate_header('x-all', '')).to eq('')
      expect(header_obfuscator.obfuscate_header('x-fixed', nil)).to eq('****')
      expect(header_obfuscator.obfuscate_header('x-fixed', '')).to eq('****')
      expect(header_obfuscator.obfuscate_header('x-first', nil)).to be_nil
      expect(header_obfuscator.obfuscate_header('x-first', '')).to eq('')
      expect(header_obfuscator.obfuscate_header('x-last', nil)).to be_nil
      expect(header_obfuscator.obfuscate_header('x-last', '')).to eq('')
    end

  end
end
