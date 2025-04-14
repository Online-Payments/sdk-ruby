require 'onlinepayments/sdk/authentication/authorization_type'

module OnlinePayments
  module SDK
    # A CommunicatorConfiguration stores all data used to initialize an {OnlinePayments::SDK::Communicator}.
    #
    # @attr [String] api_endpoint         Base URL to the Online Payments platform
    # @attr [String] api_key_id           Identifier of the _secret_api_key_ used in authentication.
    # @attr [String] secret_api_key       Secret key used in authentication
    # @attr [String] authorization_type   String representing the authentication algorithm used
    # @attr [Integer] connect_timeout     The number of seconds before a connection attempt with the Online Payments platform times out.
    # @attr [Integer] socket_timeout      The number of seconds before a timeout occurs when transmitting data to or from the Online Payments platform.
    # @attr [Integer] max_connections     The number of connections with the Online Payments platform that are kept alive in the connection pool.
    #       These connections will be reused when possible.
    # @attr [OnlinePayments::SDK::ProxyConfiguration] proxy_configuration Proxy settings.
    # @attr [String] integrator           Name of the integrator
    # @attr [OnlinePayments::SDK::Domain::ShoppingCartExtension] shopping_cart_extension Shopping cart-related metadata.
    class CommunicatorConfiguration
      private

      DEFAULT_MAX_CONNECTIONS = 10

      public

      # The default number of connections that are kept alive in the connection pool.
      # Used if _maxConnections_ is not present in the properties.
      # @return [Integer]
      def self.default_max_connections
        DEFAULT_MAX_CONNECTIONS
      end

      # Creates a new CommunicatorConfiguration instance.
      #
      # If a _properties_ object is given, it will be parsed like a hash in order to read these attributes.
      # If a value is given in both the _properties_ hash and as a separate parameter,
      # the separate parameter will take precedence over the value in the properties.
      #
      # @param properties              [Hash, nil] hash that may contain any of the other parameters.
      # @param api_endpoint            [String, nil] the base URL to the Online Payments platform.
      # @param api_key_id              [String, nil] the identifier of the _secret_api_key_ used to authenticate requests.
      # @param secret_api_key          [String, nil] the key used to authenticate requests sent to the Online Payments platform.
      # @param authorization_type      [String, nil] string describing the authorization protocol to follow.
      # @param connect_timeout         [Integer, nil] the number of seconds before a connection attempt with the Online Payments platform times out.
      # @param socket_timeout          [Integer, nil] the number of seconds before a timeout occurs when transmitting data to or from the Online Payments platform.
      # @param max_connections         [Integer, nil] the number of connections with the Online Payments platform that are kept alive in the connection pool.
      #                                These connections will be reused when possible.
      # @param proxy_configuration     [OnlinePayments::SDK::ProxyConfiguration, nil] stores the URL to a proxy to be used in all communication,
      #                                or _nil_ if no proxy should be used.
      # @param integrator              [String, nil] name of the integrator
      # @param shopping_cart_extension [OnlinePayments::SDK::Domain::ShoppingCartExtension, nil] stores shopping cart-related metadata.
      def initialize(properties: nil, api_endpoint: nil,
                     api_key_id: nil, secret_api_key: nil,
                     authorization_type: nil,
                     connect_timeout: nil, socket_timeout: nil,
                     max_connections: nil, proxy_configuration: nil,
                     integrator: nil, shopping_cart_extension: nil)
        unless properties.nil?
          @api_endpoint = get_endpoint(properties)
          @authorization_type = Authentication::AuthorizationType.get_authorization(properties['onlinePayments.api.authorizationType'])
          @connect_timeout = properties['onlinePayments.api.connectTimeout']
          @socket_timeout = properties['onlinePayments.api.socketTimeout']
          @max_connections = get_property(properties, 'onlinePayments.api.maxConnections', DEFAULT_MAX_CONNECTIONS)

          proxy_uri = properties['onlinePayments.api.proxy.uri']
          proxy_user = properties['onlinePayments.api.proxy.username']
          proxy_pass = properties['onlinePayments.api.proxy.password']
          unless proxy_uri.nil?
            @proxy_configuration = ProxyConfiguration.new(address: URI(proxy_uri),
                                                          username: proxy_user,
                                                          password: proxy_pass)
          end
          @integrator = properties['onlinePayments.api.integrator']
          @shopping_cart_extension = get_shopping_cart_extension(properties)
        end

        if api_endpoint
          @api_endpoint = api_endpoint
        end
        if api_key_id
          @api_key_id = api_key_id
        end
        if secret_api_key
          @secret_api_key = secret_api_key
        end
        if authorization_type
          @authorization_type = authorization_type
        end
        if connect_timeout
          @connect_timeout = connect_timeout
        end
        if socket_timeout
          @socket_timeout = socket_timeout
        end
        if max_connections
          @max_connections = max_connections
        end
        if proxy_configuration
          @proxy_configuration = proxy_configuration
        end
        if integrator
          @integrator = integrator
        end
        if shopping_cart_extension
          @shopping_cart_extension = shopping_cart_extension
        end
      end

      attr_accessor :api_endpoint

      attr_accessor :api_key_id
      attr_accessor :secret_api_key
      attr_accessor :authorization_type

      attr_accessor :connect_timeout
      attr_accessor :socket_timeout
      attr_accessor :max_connections

      attr_accessor :proxy_configuration

      attr_accessor :integrator
      attr_accessor :shopping_cart_extension

      private

      def get_property(properties, key, default_value)
        property_value = properties[key]
        if property_value.nil?
          default_value
        else
          property_value
        end
      end

      def get_endpoint(properties)
        host = properties['onlinePayments.api.endpoint.host']
        scheme = properties['onlinePayments.api.endpoint.scheme']
        port = properties['onlinePayments.api.endpoint.port']
        if scheme.nil?
          scheme = 'https'
        end
        if port.nil?
          port = -1
        end
        create_uri(scheme, host, port)
      end

      def create_uri(scheme, host, port)
        if port == -1
          "#{scheme}://#{host}"
        else
          "#{scheme}://#{host}:#{port.to_s}"
        end
      end

      def get_shopping_cart_extension(properties)
        creator = properties['onlinePayments.api.shoppingCartExtension.creator']
        name = properties['onlinePayments.api.shoppingCartExtension.name']
        version = properties['onlinePayments.api.shoppingCartExtension.version']
        extension_id = properties['onlinePayments.api.shoppingCartExtension.extensionId']
        if creator.nil? && name.nil? && version.nil? && extension_id.nil?
          nil
        else
          Domain::ShoppingCartExtension.new(creator, name, version, extension_id)
        end
      end
    end
  end
end
