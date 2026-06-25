require 'spec_helper'
require 'onlinepayments/sdk/domain/shopping_cart_extension'

ShoppingCartExtension ||= OnlinePayments::SDK::Domain::ShoppingCartExtension

describe ShoppingCartExtension do

  describe 'construction with required params' do
    subject { ShoppingCartExtension.new('MyCompany', 'MyPlugin', '1.0') }

    it 'stores creator' do
      expect(subject.creator).to eq('MyCompany')
    end

    it 'stores name' do
      expect(subject.name).to eq('MyPlugin')
    end

    it 'stores version as string' do
      expect(subject.version).to eq('1.0')
    end

    it 'has nil extension_id by default' do
      expect(subject.extension_id).to be_nil
    end
  end

  describe 'construction with extension_id' do
    subject { ShoppingCartExtension.new('MyCompany', 'MyPlugin', '2.0', 'ext-123') }

    it 'stores extension_id' do
      expect(subject.extension_id).to eq('ext-123')
    end
  end

  describe 'version coercion' do
    it 'converts numeric version to string' do
      ext = ShoppingCartExtension.new('Creator', 'Name', 2)
      expect(ext.version).to eq('2')
    end

    it 'converts float version to string' do
      ext = ShoppingCartExtension.new('Creator', 'Name', 1.5)
      expect(ext.version).to eq('1.5')
    end
  end

  describe 'validation errors' do
    it 'raises ArgumentError for nil creator' do
      expect { ShoppingCartExtension.new(nil, 'Name', '1.0') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for blank creator' do
      expect { ShoppingCartExtension.new('   ', 'Name', '1.0') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for nil name' do
      expect { ShoppingCartExtension.new('Creator', nil, '1.0') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for blank name' do
      expect { ShoppingCartExtension.new('Creator', '   ', '1.0') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for nil version' do
      expect { ShoppingCartExtension.new('Creator', 'Name', nil) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_h' do
    it 'includes creator, name, version' do
      ext = ShoppingCartExtension.new('MyCo', 'Plugin', '3.1')
      hash = ext.to_h
      expect(hash['creator']).to eq('MyCo')
      expect(hash['name']).to eq('Plugin')
      expect(hash['version']).to eq('3.1')
    end

    it 'includes extensionId when set' do
      ext = ShoppingCartExtension.new('MyCo', 'Plugin', '3.1', 'ext-456')
      expect(ext.to_h['extensionId']).to eq('ext-456')
    end

    it 'omits extensionId when nil' do
      ext = ShoppingCartExtension.new('MyCo', 'Plugin', '3.1')
      expect(ext.to_h).not_to have_key('extensionId')
    end
  end

  describe '.new_from_hash' do
    it 'builds from hash with camelCase keys' do
      hash = {
        'creator' => 'HashCo',
        'name' => 'HashPlugin',
        'version' => '4.0',
        'extensionId' => 'hash-ext'
      }
      ext = ShoppingCartExtension.new_from_hash(hash)
      expect(ext.creator).to eq('HashCo')
      expect(ext.name).to eq('HashPlugin')
      expect(ext.version).to eq('4.0')
      expect(ext.extension_id).to eq('hash-ext')
    end

    it 'builds from hash without extensionId' do
      hash = { 'creator' => 'Co', 'name' => 'Plugin', 'version' => '1.0' }
      ext = ShoppingCartExtension.new_from_hash(hash)
      expect(ext.extension_id).to be_nil
    end
  end

  describe 'round-trip serialization' do
    it 'to_h then new_from_hash returns equal values' do
      original = ShoppingCartExtension.new('RoundTrip', 'Plug', '5.0', 'rt-ext')
      restored = ShoppingCartExtension.new_from_hash(original.to_h)
      expect(restored.creator).to eq('RoundTrip')
      expect(restored.name).to eq('Plug')
      expect(restored.version).to eq('5.0')
      expect(restored.extension_id).to eq('rt-ext')
    end
  end
end
