require 'spec_helper'

BodyObfuscator = OnlinePayments::SDK::Logging::Obfuscation::BodyObfuscator

describe BodyObfuscator do
  let(:prefix) { 'spec/fixtures/resources/logging/' }

  context '.obfuscate_body()' do

    context 'with null body' do
      it 'returns null body' do
        expect(BodyObfuscator.default_obfuscator.obfuscate_body(nil)).to be_nil
      end
    end

    context 'with empty body' do
      it 'returns empty body' do
        expect(BodyObfuscator.default_obfuscator.obfuscate_body('')).to eq('')
      end
    end

    it 'works with card' do
      body     = IO.read(prefix + 'bodyWithCardOriginal.json')
      expected = IO.read(prefix + 'bodyWithCardObfuscated.json')
      expect(BodyObfuscator.default_obfuscator.obfuscate_body(body)).to eq(expected)
    end

    it 'works with custom card rule' do
      def obfuscate_custom(value)
        range = 6...(value.length - 4)
        value[range] = '*' * range.size
        value
      end

      body_obfuscator = BodyObfuscator.new(additional_rules={
        'cardNumber' => method(:obfuscate_custom)
      })

      body     = IO.read(prefix + 'bodyWithCardOriginal.json')
      expected = IO.read(prefix + 'bodyWithCardCustomObfuscated.json')
      expect(body_obfuscator.obfuscate_body(body)).to eq(expected)
    end

    it 'works with iban' do
      body     = IO.read(prefix + 'bodyWithIbanOriginal.json')
      expected = IO.read(prefix + 'bodyWithIbanObfuscated.json')
      expect(BodyObfuscator.default_obfuscator.obfuscate_body(body)).to eq(expected)
    end

    it 'works with bin' do
      body     = IO.read(prefix + 'bodyWithBinOriginal.json')
      expected = IO.read(prefix + 'bodyWithBinObfuscated.json')
      expect(BodyObfuscator.default_obfuscator.obfuscate_body(body)).to eq(expected)
    end

    it 'works when there is no match' do
      body = IO.read(prefix + 'bodyNoObfuscation.json')
      expect(BodyObfuscator.default_obfuscator.obfuscate_body(body)).to eq(body)
    end

    it 'works with object' do
      body     = IO.read(prefix + 'bodyWithObjectOriginal.json')
      expected = IO.read(prefix + 'bodyWithObjectObfuscated.json')
      expect(BodyObfuscator.default_obfuscator.obfuscate_body(body)).to eq(expected)
    end

    it 'keeps the default rules when initialized without additional rules' do
      body     = IO.read(prefix + 'bodyWithCardOriginal.json')
      expected = IO.read(prefix + 'bodyWithCardObfuscated.json')
      expect(BodyObfuscator.new.obfuscate_body(body)).to eq(expected)
    end

    it 'supports multiple custom rules in one obfuscator' do
      body_obfuscator = BodyObfuscator.new(additional_rules={
        'cardNumber' => ->(value) { "CARD_#{value.length}" },
        'iban' => ->(value) { value[-4..] },
        'value' => ->(value) { value.reverse }
      })

      body = '{"cardNumber":"1234567890123456","iban":"NL91ABNA0417164300","value":"secret"}'

      expect(body_obfuscator.obfuscate_body(body)).to eq(
        '{"cardNumber":"CARD_16","iban":"4300","value":"terces"}'
      )
    end

    it 'obfuscates UTF-8 bodies correctly' do
      body = "{\"cardholderName\":\"J\u00F6hn D\u0153\",\"city\":\"\u0141\u00F3d\u017A\"}"

      obfuscated = BodyObfuscator.default_obfuscator.obfuscate_body(body)

      expect(obfuscated.encoding).to eq(Encoding::UTF_8)
      expect(obfuscated).to eq('{"cardholderName":"*******","city":"Łódź"}')
    end
  end
end
