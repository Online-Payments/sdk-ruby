require 'spec_helper'

include OnlinePayments::SDK

module OnlinePayments::SDK::Webhooks
  module Webhooks
  end
end

describe Webhooks::Webhooks do
  let(:webhooks_helper) { Webhooks::WebhooksHelper.new(OnlinePayments::SDK::JSON::DefaultMarshaller.instance, Webhooks::InMemorySecretKeyStore.instance) }

  context 'construction' do
    it 'uses the default marshaller' do
      expect(webhooks_helper.instance_variable_get(:@marshaller)).to eq(OnlinePayments::SDK::JSON::DefaultMarshaller.instance)
    end

    it 'uses the given key store' do
      signature_validator = webhooks_helper.instance_variable_get(:@signature_validator)
      expect(signature_validator.instance_variable_get(:@secret_key_store)).to eq(Webhooks::InMemorySecretKeyStore.instance)
    end
  end
end
