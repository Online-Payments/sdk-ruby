require 'spec_helper'
require 'integration_setup'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/communicator_configuration'
require 'onlinepayments/sdk/proxy_configuration'
require 'onlinepayments/sdk/communication_exception'
require 'onlinepayments/sdk/merchant/services/services_client'

require 'webrick'
require 'webrick/httpproxy'

describe 'proxies' do

  context 'using proxy server' do
    proxy_server = nil

    password_filename = 'password_file'

    before :context do
      WebMock.allow_net_connect!

      # set up a proxy
      proxy_server = Thread.new do
        config = { Realm: 'testing' }
        htpasswd = WEBrick::HTTPAuth::Htpasswd.new(password_filename) # create new Apache password file
        htpasswd.set_passwd config[:Realm], 'online-payments', 'online-payments' # same as properties.proxy.yml
        config[:UserDB] = htpasswd
        basic_auth = WEBrick::HTTPAuth::ProxyBasicAuth.new(config)

        auth_handler = Proc.new do |req, res|
          basic_auth.authenticate(req, res)
        end

        proxy = WEBrick::HTTPProxyServer.new(Port: 9999, ProxyVia: falseFt,
                                             ProxyAuthProc: auth_handler)
        Signal.trap('INT') do
          proxy.shutdown
        end

        proxy.start
      end

      sleep 1 # wait for the proxy server
    end

    after :context do
      Thread.kill(proxy_server)
      File.delete(password_filename)
      WebMock.disable_net_connect!
    end

    # NOTE: if this test is running for a long time with no response
    # check https://payment.preprod.online-payments.com coz this is where merchant
    # connects to.
    it 'can be connected to' do
      Integration.init_client(true) do |client|
        services = client.merchant(Integration::MERCHANT_ID).services
        expect(services).to be_an_instance_of(OnlinePayments::SDK::Merchant::Services::ServicesClient)
      end
    end

    # test that connecting to a nonexistent proxy will raise an error
    it 'should be connected to if possible' do
      yaml = YAML.load_file(Integration::PROPERTIES_URI_PROXY)
      config = OnlinePayments::SDK::CommunicatorConfiguration.new(properties: yaml, connect_timeout: 0.5, socket_timeout: 0.5,
                                                                  authorization_type: 'v1HMAC',
                                                                  api_key_id: Integration::API_KEY_ID,
                                                                  secret_api_key: Integration::SECRET_API_KEY,
                                                                  proxy_configuration: OnlinePayments::SDK::ProxyConfiguration.new(host: 'localhost',
                                                                                                                                   port: 65535,
                                                                                                                                   username: 'arg',
                                                                                                                                   password: 'blarg'))
      begin
        client = OnlinePayments::SDK::Factory.create_client_from_configuration(config)
        id_key = SecureRandom.uuid
        context = OnlinePayments::SDK::CallContext.new(id_key)
        expect { client.merchant(Integration::MERCHANT_ID).services.test_connection(context) }.to raise_error(OnlinePayments::SDK::CommunicationException)
      ensure
        client.close if client
      end
    end
  end # end of using proxy server
end
