require 'spec_helper'
require 'integration_setup'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/communicator_configuration'
require 'onlinepayments/sdk/proxy_configuration'
require 'onlinepayments/sdk/communication/communication_exception'

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
        proxy_configuration = Integration.init_communicator_configuration(properties_url: Integration::PROPERTIES_URI_PROXY).proxy_configuration
        htpasswd.set_passwd config[:Realm], proxy_configuration.username, proxy_configuration.password
        config[:UserDB] = htpasswd
        basic_auth = WEBrick::HTTPAuth::ProxyBasicAuth.new(config)

        auth_handler = Proc.new do |req, res|
          basic_auth.authenticate(req, res)
        end

        proxy = WEBrick::HTTPProxyServer.new(Port: 9999, ProxyVia: false,
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
    # check https://payment.preprod.online-payments.com because this is where merchant
    # connects to.
    it 'can be connected to' do
      Integration.init_client(true) do |client|
        services = client.merchant(Integration::MERCHANT_ID).services
        expect(services).to be_an_instance_of(OnlinePayments::SDK::Merchant::Services::ServicesClient)
      end
    end
  end # end of using proxy server
end
