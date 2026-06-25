require 'spec_helper'
require 'uri'
require 'onlinepayments/sdk/proxy_configuration'

ProxyConfiguration ||= OnlinePayments::SDK::ProxyConfiguration

describe ProxyConfiguration do

  describe 'construction with host/port/scheme' do
    subject { ProxyConfiguration.new(host: 'proxy.example.com', port: 8080, scheme: 'http') }

    it 'stores host' do
      expect(subject.host).to eq('proxy.example.com')
    end

    it 'stores port' do
      expect(subject.port).to eq(8080)
    end

    it 'stores scheme' do
      expect(subject.scheme).to eq('http')
    end

    it 'stores nil username and password by default' do
      expect(subject.username).to be_nil
      expect(subject.password).to be_nil
    end
  end

  describe 'construction with default scheme' do
    it 'defaults scheme to http when not provided' do
      pc = ProxyConfiguration.new(host: 'proxy.example.com', port: 3128)
      expect(pc.scheme).to eq('http')
    end
  end

  describe 'construction with username and password' do
    subject do
      ProxyConfiguration.new(host: 'proxy.example.com', port: 8080, username: 'user', password: 'pass')
    end

    it 'stores username' do
      expect(subject.username).to eq('user')
    end

    it 'stores password' do
      expect(subject.password).to eq('pass')
    end
  end

  describe 'construction with address URI' do
    let(:address) { URI.parse('https://secure-proxy.example.com:9090') }
    subject { ProxyConfiguration.new(address: address) }

    it 'uses host from address' do
      expect(subject.host).to eq('secure-proxy.example.com')
    end

    it 'uses port from address' do
      expect(subject.port).to eq(9090)
    end

    it 'uses scheme from address' do
      expect(subject.scheme).to eq('https')
    end
  end

  describe 'construction with address URI and credentials' do
    let(:address) { URI.parse('http://proxy.example.com:3128') }

    it 'stores username and password' do
      proxy_configuration = ProxyConfiguration.new(address: address, username: 'user', password: 'pass')

      expect(proxy_configuration.username).to eq('user')
      expect(proxy_configuration.password).to eq('pass')
    end

    it 'accepts nil username and password' do
      proxy_configuration = ProxyConfiguration.new(address: address, username: nil, password: nil)

      expect(proxy_configuration.username).to be_nil
      expect(proxy_configuration.password).to be_nil
    end

    it 'accepts a nil username with a password' do
      proxy_configuration = ProxyConfiguration.new(address: address, username: nil, password: 'pass')

      expect(proxy_configuration.username).to be_nil
      expect(proxy_configuration.password).to eq('pass')
    end

    it 'accepts a username with a nil password' do
      proxy_configuration = ProxyConfiguration.new(address: address, username: 'user', password: nil)

      expect(proxy_configuration.username).to eq('user')
      expect(proxy_configuration.password).to be_nil
    end
  end

  describe 'construction with address URI without explicit port' do
    it 'defaults http addresses to port 80' do
      proxy_configuration = ProxyConfiguration.new(address: URI.parse('http://proxy.example.com'))

      expect(proxy_configuration.port).to eq(80)
    end

    it 'defaults https addresses to port 443' do
      proxy_configuration = ProxyConfiguration.new(address: URI.parse('https://proxy.example.com'))

      expect(proxy_configuration.port).to eq(443)
    end
  end

  describe 'address overrides individual host/port/scheme' do
    let(:address) { URI.parse('https://override-proxy.com:7070') }
    subject do
      ProxyConfiguration.new(
        host: 'ignored.example.com',
        port: 8080,
        scheme: 'http',
        address: address
      )
    end

    it 'overrides host' do
      expect(subject.host).to eq('override-proxy.com')
    end

    it 'overrides port' do
      expect(subject.port).to eq(7070)
    end

    it 'overrides scheme' do
      expect(subject.scheme).to eq('https')
    end
  end

  describe 'validation errors' do
    it 'raises ArgumentError when scheme is blank' do
      expect { ProxyConfiguration.new(host: 'host', port: 8080, scheme: '   ') }
        .to raise_error(ArgumentError, /scheme is required/)
    end

    it 'raises ArgumentError when host is blank' do
      expect { ProxyConfiguration.new(host: '   ', port: 8080) }
        .to raise_error(ArgumentError, /host is required/)
    end

    it 'raises ArgumentError when port is 0' do
      expect { ProxyConfiguration.new(host: 'host', port: 0) }
        .to raise_error(ArgumentError, /port is required/)
    end

    it 'raises ArgumentError when port is negative' do
      expect { ProxyConfiguration.new(host: 'host', port: -1) }
        .to raise_error(ArgumentError, /port is required/)
    end

    it 'raises ArgumentError when port exceeds 65535' do
      expect { ProxyConfiguration.new(host: 'host', port: 65536) }
        .to raise_error(ArgumentError, /port is required/)
    end

    it 'accepts port 65535' do
      expect { ProxyConfiguration.new(host: 'host', port: 65535) }.not_to raise_error
    end

    it 'accepts port 1' do
      expect { ProxyConfiguration.new(host: 'host', port: 1) }.not_to raise_error
    end
  end

  describe 'attribute writers' do
    subject(:proxy_configuration) do
      ProxyConfiguration.new(host: 'proxy.example.com', port: 3128, scheme: 'http', username: 'user', password: 'pass')
    end

    it 'updates scheme' do
      proxy_configuration.scheme = 'https'
      expect(proxy_configuration.scheme).to eq('https')
    end

    it 'updates host' do
      proxy_configuration.host = 'newproxy.example.com'
      expect(proxy_configuration.host).to eq('newproxy.example.com')
    end

    it 'updates port' do
      proxy_configuration.port = 8080
      expect(proxy_configuration.port).to eq(8080)
    end

    it 'updates username' do
      proxy_configuration.username = 'newuser'
      expect(proxy_configuration.username).to eq('newuser')
    end

    it 'updates password' do
      proxy_configuration.password = 'newpass'
      expect(proxy_configuration.password).to eq('newpass')
    end
  end

  describe '#proxy_uri' do
    it 'returns scheme://host:port' do
      pc = ProxyConfiguration.new(host: 'my-proxy.com', port: 3128, scheme: 'http')
      expect(pc.proxy_uri).to eq('http://my-proxy.com:3128')
    end

    it 'works for https' do
      pc = ProxyConfiguration.new(host: 'my-proxy.com', port: 443, scheme: 'https')
      expect(pc.proxy_uri).to eq('https://my-proxy.com:443')
    end
  end

  describe '#to_s' do
    it 'returns the proxy_uri' do
      pc = ProxyConfiguration.new(host: 'proxy.example.com', port: 8080)
      expect(pc.to_s).to eq('http://proxy.example.com:8080')
    end
  end
end
