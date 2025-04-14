require 'spec_helper'
require 'yaml'

CommunicatorConfiguration ||= OnlinePayments::SDK::CommunicatorConfiguration

describe 'CommunicatorConfiguration' do

  it 'can be constructed without a proxy' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://payment.preprod.online-payments.com')
    expect(communicator_config.authorization_type).to eq('v1HMAC')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.api_key_id).to be_nil
    expect(communicator_config.secret_api_key).to be_nil
    expect(communicator_config.proxy_configuration).to be_nil
    expect(communicator_config.integrator).to be_nil
    expect(communicator_config.shopping_cart_extension).to be_nil
  end

  it 'can be constructed with a proxy, without authentication' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.proxy.uri: http://proxy.example.org:3128'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)
    proxy_config = communicator_config.proxy_configuration

    expect(communicator_config.api_endpoint).to eq('https://payment.preprod.online-payments.com')
    expect(communicator_config.authorization_type).to eq('v1HMAC')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.api_key_id).to be_nil
    expect(communicator_config.secret_api_key).to be_nil
    expect(proxy_config).to be_truthy
    expect(proxy_config.scheme).to eq('http')
    expect(proxy_config.host).to eq('proxy.example.org')
    expect(proxy_config.port).to eq(3128)
    expect(proxy_config.username).to be_nil
    expect(proxy_config.password).to be_nil
  end

  it 'can be constructed to authenticate to a proxy' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.proxy.uri: http://proxy.example.org:3128
            onlinePayments.api.proxy.username: test-username
            onlinePayments.api.proxy.password: test-password'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)
    proxy_config = communicator_config.proxy_configuration

    expect(communicator_config.api_endpoint).to eq('https://payment.preprod.online-payments.com')
    expect(communicator_config.authorization_type).to eq('v1HMAC')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.api_key_id).to be_nil
    expect(communicator_config.secret_api_key).to be_nil
    expect(proxy_config).to be_truthy
    expect(proxy_config.scheme).to eq('http')
    expect(proxy_config.host).to eq('proxy.example.org')
    expect(proxy_config.port).to eq(3128)
    expect(proxy_config.username).to eq('test-username')
    expect(proxy_config.password).to eq('test-password')
  end

  it 'accepts a different number of maximum connections' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.maxConnections: 100'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://payment.preprod.online-payments.com')
    expect(communicator_config.authorization_type).to eq('v1HMAC')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)
    expect(communicator_config.max_connections).to eq(100)

    expect(communicator_config.api_key_id).to be_nil
    expect(communicator_config.secret_api_key).to be_nil
    expect(communicator_config.proxy_configuration).to be_nil
  end

  it 'uses specific scheme to override default' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.endpoint.scheme: http'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('http://payment.preprod.online-payments.com')
  end

  it 'uses specific port to override default' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.endpoint.port: 8080'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://payment.preprod.online-payments.com:8080')
  end

  it 'uses specific scheme and port to override default' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.endpoint.scheme: http
            onlinePayments.api.endpoint.port: 8080'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('http://payment.preprod.online-payments.com:8080')
  end

  it 'stores shoppingCartExtension data' do
    yaml = '---
            onlinePayments.api.endpoint.host: payment.preprod.online-payments.com
            onlinePayments.api.authorizationType: v1HMAC
            onlinePayments.api.connectTimeout: 20
            onlinePayments.api.socketTimeout: 10
            onlinePayments.api.integrator: OnlinePayments.Integrator
            onlinePayments.api.shoppingCartExtension.creator: OnlinePayments.Creator
            onlinePayments.api.shoppingCartExtension.name: OnlinePayments.ShoppingCarts
            onlinePayments.api.shoppingCartExtension.version: 1.0
            onlinePayments.api.shoppingCartExtension.extensionId: ExtensionId'
    config = YAML.load(yaml)

    communicator_config = CommunicatorConfiguration.new(properties: config)

    expect(communicator_config.api_endpoint).to eq('https://payment.preprod.online-payments.com')
    expect(communicator_config.authorization_type).to eq('v1HMAC')
    expect(communicator_config.connect_timeout).to eq(20)
    expect(communicator_config.socket_timeout).to eq(10)

    expect(communicator_config.api_key_id).to be_nil
    expect(communicator_config.secret_api_key).to be_nil
    expect(communicator_config.proxy_configuration).to be_nil
    expect(communicator_config.integrator).to eq('OnlinePayments.Integrator')
    expect(communicator_config.shopping_cart_extension).to be_truthy
    expect(communicator_config.shopping_cart_extension.creator).to eq('OnlinePayments.Creator')
    expect(communicator_config.shopping_cart_extension.name).to eq('OnlinePayments.ShoppingCarts')
    expect(communicator_config.shopping_cart_extension.version).to eq('1.0')
    expect(communicator_config.shopping_cart_extension.extension_id).to eq('ExtensionId')
  end
end
