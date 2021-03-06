require 'spec_helper'

HeaderObfuscator ||= OnlinePayments::SDK::Logging::HeaderObfuscator
ValueObfuscator ||= OnlinePayments::SDK::Logging::ValueObfuscator

describe HeaderObfuscator do
  subject(:sample) { HeaderObfuscator.new(obsfs) }
  context 'initialize' do
    let(:obsfs) { { 'k1' => ValueObfuscator.INSTANCE,
                    'k2' => ValueObfuscator.INSTANCE } }
    it 'is cass insensitive' do
      obsfs_copy = sample.instance_variable_get(:@obfuscators)
      expect(
        obsfs_copy['k1']
      ).to equal(obsfs_copy['K1'])
    end
  end

  it '.builder returns new Builder obj' do
    expect(
      HeaderObfuscator.builder.is_a? HeaderObfuscator::Builder
    ).to be(true)
  end

  context 'Builder' do
    it 'checks argument type' do
      b = HeaderObfuscator.builder
      expect {
        b.with_field(123)
      }.to raise_error(ArgumentError)

      expect {
        b.with_sensitive_field(123)
      }.to raise_error(ArgumentError)
    end

    it 'inherits parent methods' do
      b = HeaderObfuscator.builder
      expect {
        b.with_sensitive_field('k1')
        b.with_sensitive_field('k2')
      }.not_to raise_error
    end

    it 'implements build method' do
      expect(
        HeaderObfuscator.builder.build.is_a? HeaderObfuscator
      ).to be(true)
    end
  end
end
