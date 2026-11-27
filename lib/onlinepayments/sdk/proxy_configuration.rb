# frozen_string_literal: true

require 'uri'

module OnlinePayments
  module SDK
    # Contains the URL, username and password of a proxy.
    #
    # @attr [String] scheme   Proxy scheme (http or https)
    # @attr [String] host     Proxy hostname
    # @attr [Integer] port    Proxy port
    # @attr [String] username Proxy authentication username
    # @attr [String] password Proxy authentication password
    class ProxyConfiguration
      MASK = '********'
      private_constant :MASK

      # Initialize a new ProxyConfiguration from the parameter hash.
      # In order to be complete either host, port and scheme, or an address is required.
      #
      # @param args [Hash] the parameters to initialize the proxy configuration with
      # @option args [String] :host host part of the URL to the proxy.
      # @option args [Integer] :port port the proxy will be accessed through.
      # @option args [String] :scheme HTTP scheme used to communicate with the proxy (http or https).
      # @option args [String, URI] :address full URI to the proxy excluding username and password.
      #             If given this uri takes precedence over individual host, port and scheme.
      # @option args [String] :username username used in authentication to the proxy.
      # @option args [String] :password password used to authenticate to the proxy.
      def initialize(args)
        host = args[:host]
        port = args[:port]
        username = args[:username]
        password = args[:password]
        scheme = args[:scheme] || 'http'

        # Don't switch the order, a given address overrides host, port and username
        address = args[:address]
        address = URI(address) if address.is_a?(String)
        host = address.host if address
        port = address.port if address
        scheme = address.scheme if address

        raise ArgumentError, 'scheme is required' unless scheme && !scheme.strip.empty?
        raise ArgumentError, 'host is required' unless host && !host.strip.empty?
        raise ArgumentError, 'port is required' unless port && (port > 0) && (port <= 65_535)

        @host = host
        @port = port
        @username = username
        @password = password
        @scheme = scheme
      end

      attr_accessor :scheme, :host, :port, :username, :password

      # @return [String] a URL string representation of the proxy, excluding authentication.
      def proxy_uri
        "#{scheme}://#{host}:#{port}"
      end

      def to_s
        proxy_uri
      end

      # @return [String] a description of this proxy configuration in which the password is masked
      def inspect
        credentials = if username.nil?
                        ''
                      elsif password.nil?
                        "#{username}@"
                      else
                        "#{username}:#{MASK}@"
                      end
        "#<#{self.class.name} #{scheme}://#{credentials}#{host}:#{port}>"
      end
    end
  end
end
