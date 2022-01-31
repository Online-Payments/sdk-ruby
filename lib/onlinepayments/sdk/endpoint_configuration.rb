require 'uri'

module OnlinePayments::SDK

  # Base class for configuration classes in the SDK.
  #
  # @attr [String] api_endpoint     The base URL to the Online Payments platform.
  # @attr [Integer] connect_timeout The number of seconds before a connection attempt with the Online Payments platform times out.
  # @attr [Integer] socket_timeout  The number of seconds before a timeout occurs when transmitting data to or from the Online Payments platform.
  # @attr [Integer] max_connections The number of connections with the Online Payments platform that are kept alive in the connection pool.
  #       These connections will be reused when possible.
  # @attr [OnlinePayments::SDK::ProxyConfiguration] proxy_configuration Proxy settings.
  # @attr [String] integrator       Name of the integrator
  # @attr [OnlinePayments::SDK::Domain::ShoppingCartExtension] shopping_cart_extension Shopping cart-related metadata.
  class EndpointConfiguration
    DEFAULT_CONNECT_TIMEOUT = 10
    DEFAULT_SOCKET_TIMEOUT = 10
    DEFAULT_MAX_CONNECTIONS = 10

    # The default number of seconds before a connection attempt with the Online Payments platform times out.
    # Used if _connectTimeout_ is not present in the properties.
    def self.default_connect_timeout
      DEFAULT_CONNECT_TIMEOUT
    end

    # The default number of seconds before a timeout occurs when transmitting data to or from the Online Payments platform.
    # Used if _socketTimeout_ is not present in the properties.
    def self.default_socket_timeout
      DEFAULT_SOCKET_TIMEOUT
    end

    # The default number of connections that are kept alive in the connection pool.
    # Used if _maxConnections_ is not present in the properties.
    def self.default_max_connections
      DEFAULT_MAX_CONNECTIONS
    end

    # Initializes a new EndpointConfiguration.
    #
    # The given _properties_ is searched for settings using properties[prefix + '.setting_name']
    # The following settings are searched:
    #
    # endpoint::                This property is searched for *endpoint.host*, *endpoint.scheme* and *endpoint.port*.
    #                           The found host, scheme and port are used to construct the base URL to the Online Payments platform.
    # connectTimeout::          The number of seconds before a connection attempt with the Online Payments platform times out.
    # socketTimeout::           The number of seconds before a timeout occurs when transmitting data to or from the Online Payments platform.
    # maxConnections::          The number of connections with the Online Payments platform
    #                           that are kept alive in the connection pool. These connections will be reused when possible.
    # proxy::                   This property is searched for *proxy.uri*, *proxy.username* and *proxy.password*.
    #                           The found URI, username and password are used
    #                           for connecting to the Online Payments platform using a proxy.
    # integrator::              Name of the integrator
    # shoppingCartExtension::   Will be used to initialize a {OnlinePayments::SDK::Domain::ShoppingCartExtension}.
    def initialize(properties = nil, prefix = nil)
      return unless properties

      @api_endpoint = get_endpoint(properties, prefix)
      @connect_timeout = get_property(properties, "#{prefix}.connectTimeout", DEFAULT_CONNECT_TIMEOUT)
      @socket_timeout = get_property(properties, "#{prefix}.socketTimeout", DEFAULT_SOCKET_TIMEOUT)
      @max_connections = get_property(properties, "#{prefix}.maxConnections", DEFAULT_MAX_CONNECTIONS)

      proxy_uri = properties["#{prefix}.proxy.uri"]
      if proxy_uri
        proxy_user = properties["#{prefix}.proxy.username"]
        proxy_pass = properties["#{prefix}.proxy.password"]
        @proxy_configuration = ProxyConfiguration.new(address: URI(proxy_uri),
                                                      username: proxy_user,
                                                      password: proxy_pass)
      end
      @integrator = properties["#{prefix}.integrator"]
      @shopping_cart_extension = get_shopping_cart_extension(properties, prefix)
    end

    protected

    def set_endpoint(endpoint)
      if endpoint
        raise ArgumentError, 'endpoint should not contain a path' if endpoint.path
        if endpoint.userinfo || endpoint.query || endpoint.fragment
          raise ArgumentError('endpoint should not contain user info, query or fragment')
        end
      end
      @api_endpoint = endpoint
    end

    private

    def get_property(properties, key, default_value)
      property_value = properties[key]
      property_value.nil? ? default_value : property_value
    end

    def get_endpoint(properties, prefix)
      host = properties["#{prefix}.endpoint.host"]
      scheme = properties["#{prefix}.endpoint.scheme"] || 'https'
      port = properties["#{prefix}.endpoint.port"] || -1
      create_uri(scheme, host, port)
    end

    def create_uri(scheme, host, port)
      port == -1 ? "#{scheme}://#{host}" : "#{scheme}://#{host}:#{port}"
    end

    def get_shopping_cart_extension(properties, prefix)
      creator = properties["#{prefix}.shoppingCartExtension.creator"]
      name = properties["#{prefix}.shoppingCartExtension.name"]
      version = properties["#{prefix}.shoppingCartExtension.version"]
      extension_id = properties["#{prefix}.shoppingCartExtension.extensionId"]
      (creator || name || version || extension_id) ?
        Domain::ShoppingCartExtension.new(creator, name, version, extension_id) :
        nil
    end

    public

    attr_reader :api_endpoint

    attr_accessor :connect_timeout
    attr_accessor :socket_timeout
    attr_accessor :max_connections

    attr_accessor :proxy_configuration

    attr_accessor :integrator
    attr_accessor :shopping_cart_extension
  end
end
