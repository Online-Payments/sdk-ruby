require 'spec_helper'
require 'uri'

Communicator ||= OnlinePayments::SDK::Communicator
DefaultMarshaller ||= OnlinePayments::SDK::DefaultImpl::DefaultMarshaller
RequestParam ||= OnlinePayments::SDK::RequestParam

describe Communicator do

  let(:connection) { instance_double('DefaultConnection') }
  let(:authenticator) { instance_double('DefaultAuthenticator') }
  let(:meta_data_provider) { instance_double('MetaDataProvider') }
  let(:communicator) { Communicator.new('https://payment.preprod.online-payments.com', connection, authenticator, meta_data_provider, DefaultMarshaller.INSTANCE) }

  context 'to_absolute_uri()' do
    it 'accepts a uri with or without a leading slash' do
      uri1 = communicator.send(:to_absolute_uri, 'v2/merchant/1234/services/testconnection', [])
      uri2 = communicator.send(:to_absolute_uri, '/v2/merchant/1234/services/testconnection', [])
      # Ruby URI library adds port in HTTPS url's by default
      expect(uri1.to_s).to eq('https://payment.preprod.online-payments.com:443/v2/merchant/1234/services/testconnection')
      expect(uri2.to_s).to eq('https://payment.preprod.online-payments.com:443/v2/merchant/1234/services/testconnection')
    end

    it 'adds request parameters to the uri' do
      request_params = [RequestParam.new('amount', '123'), RequestParam.new('source', 'USD'),
                        RequestParam.new('target', 'EUR'), RequestParam.new('dummy', 'é&%=')]

      uri = communicator.send(:to_absolute_uri, 'v2/merchant/1234/services/testconnection', request_params)

      expect(uri.to_s).to eq('https://payment.preprod.online-payments.com:443/v2/merchant/1234/services/testconnection'\
                             '?amount=123&source=USD&target=EUR&dummy=%C3%A9%26%25%3D')
    end
  end
end
