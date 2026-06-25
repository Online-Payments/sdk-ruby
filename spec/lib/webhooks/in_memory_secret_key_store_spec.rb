require 'spec_helper'
require 'onlinepayments/sdk/webhooks/in_memory_secret_key_store'
require 'onlinepayments/sdk/webhooks/secret_key_not_available_exception'

InMemorySecretKeyStore       ||= OnlinePayments::SDK::Webhooks::InMemorySecretKeyStore
SecretKeyNotAvailableException ||= OnlinePayments::SDK::Webhooks::SecretKeyNotAvailableException

describe InMemorySecretKeyStore do

  let(:store) { InMemorySecretKeyStore.instance }

  before(:each) { store.clear }
  after(:each) { store.clear }

  describe 'singleton' do
    it 'always returns the same instance' do
      expect(InMemorySecretKeyStore.instance).to be(store)
    end
  end

  describe '#store_secret_key' do
    it 'stores a secret key' do
      store.store_secret_key('key-1', 'secret-1')
      expect(store.get_secret_key('key-1')).to eq('secret-1')
    end

    it 'overwrites existing key' do
      store.store_secret_key('key-1', 'old-secret')
      store.store_secret_key('key-1', 'new-secret')
      expect(store.get_secret_key('key-1')).to eq('new-secret')
    end

    it 'raises ArgumentError for nil key_id' do
      expect { store.store_secret_key(nil, 'secret') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for blank key_id' do
      expect { store.store_secret_key('   ', 'secret') }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for nil secret_key' do
      expect { store.store_secret_key('key-1', nil) }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError for blank secret_key' do
      expect { store.store_secret_key('key-1', '   ') }.to raise_error(ArgumentError)
    end
  end

  describe '#get_secret_key' do
    it 'returns the stored secret key' do
      store.store_secret_key('key-abc', 'my-secret')
      expect(store.get_secret_key('key-abc')).to eq('my-secret')
    end

    it 'raises SecretKeyNotAvailableException when key_id is not found' do
      expect { store.get_secret_key('unknown-key') }
        .to raise_error(SecretKeyNotAvailableException) do |ex|
          expect(ex.key_id).to eq('unknown-key')
          expect(ex.message).to include('unknown-key')
        end
    end

    it 'includes the exact message and key id when key_id is not found' do
      expect { store.get_secret_key('missing-key') }
        .to raise_error(SecretKeyNotAvailableException) do |ex|
          expect(ex.key_id).to eq('missing-key')
          expect(ex.message).to eq('could not find secret key for key id missing-key')
        end
    end
  end

  describe '#remove_secret_key' do
    it 'removes an existing key' do
      store.store_secret_key('rem-key', 'secret')
      store.remove_secret_key('rem-key')
      expect { store.get_secret_key('rem-key') }.to raise_error(SecretKeyNotAvailableException)
    end

    it 'is a no-op when key_id does not exist' do
      expect { store.remove_secret_key('nonexistent') }.not_to raise_error
    end
  end

  describe '#clear' do
    it 'removes all stored keys' do
      store.store_secret_key('k1', 'secret1')
      store.store_secret_key('k2', 'secret2')
      store.store_secret_key('k3', 'secret3')
      store.clear
      expect { store.get_secret_key('k1') }.to raise_error(SecretKeyNotAvailableException)
      expect { store.get_secret_key('k2') }.to raise_error(SecretKeyNotAvailableException)
      expect { store.get_secret_key('k3') }.to raise_error(SecretKeyNotAvailableException)
    end

    it 'is a no-op on empty store' do
      expect { store.clear }.not_to raise_error
    end

    it 'allows storing new keys after clear' do
      store.store_secret_key('old-key', 'old-secret')
      store.clear
      store.store_secret_key('new-key', 'new-secret')
      expect(store.get_secret_key('new-key')).to eq('new-secret')
    end
  end

  describe 'working with multiple keys' do
    it 'stores and retrieves multiple keys independently' do
      store.store_secret_key('key-1', 'secret-1')
      store.store_secret_key('key-2', 'secret-2')
      store.store_secret_key('key-3', 'secret-3')
      expect(store.get_secret_key('key-1')).to eq('secret-1')
      expect(store.get_secret_key('key-2')).to eq('secret-2')
      expect(store.get_secret_key('key-3')).to eq('secret-3')
    end

    it 'maintains separate keys independently' do
      store.store_secret_key('api-key-1', 'api-secret-1')
      store.store_secret_key('api-key-2', 'api-secret-2')
      store.remove_secret_key('api-key-1')
      expect(store.get_secret_key('api-key-2')).to eq('api-secret-2')
      expect { store.get_secret_key('api-key-1') }.to raise_error(SecretKeyNotAvailableException)
    end

    it 'handles special characters in values' do
      special_secret = "secret!@\#$%^&*()_+-=[]{}|;':\",./<>?"
      store.store_secret_key('special-key', special_secret)
      expect(store.get_secret_key('special-key')).to eq(special_secret)
    end

    it 'handles long secret values' do
      long_secret = 'a' * 10_000
      store.store_secret_key('long-key', long_secret)
      expect(store.get_secret_key('long-key')).to eq(long_secret)
    end
  end
end
