# frozen_string_literal: true

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
      DEFAULT_MAX_CONNECTIONS = 10
      MASK = '********'
      private_constant :DEFAULT_MAX_CONNECTIONS, :MASK

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
      #                                Defaults to {OnlinePayments::SDK::Authentication::AuthorizationType::V1HMAC} if not given.
      # @param connect_timeout         [Integer, nil] the number of seconds before a connection attempt with the Online Payments platform times out.
      # @param socket_timeout          [Integer, nil] the number of seconds before a timeout occurs when transmitting data to or from the Online Payments
      #                                               platform.
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
        @authorization_type = Authentication::AuthorizationType::V1HMAC
        unless properties.nil?
          @api_endpoint = get_endpoint(properties)
          authorization = properties['onlinePayments.api.authorizationType']
          @authorization_type = Authentication::AuthorizationType.get_authorization(authorization) unless authorization.nil?
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

        @api_endpoint = api_endpoint if api_endpoint
        @api_key_id = api_key_id if api_key_id
        @secret_api_key = secret_api_key if secret_api_key
        @authorization_type = authorization_type if authorization_type
        @connect_timeout = connect_timeout if connect_timeout
        @socket_timeout = socket_timeout if socket_timeout
        @max_connections = max_connections if max_connections
        @proxy_configuration = proxy_configuration if proxy_configuration
        @integrator = integrator if integrator
        @shopping_cart_extension = shopping_cart_extension if shopping_cart_extension
      end

      attr_accessor :api_endpoint, :api_key_id, :secret_api_key, :authorization_type, :connect_timeout, :socket_timeout, :max_connections,
                    :proxy_configuration, :integrator, :shopping_cart_extension

      # Creates a new CommunicatorConfiguration from environment variables.
      #
      # The following variables are read, all of them are required:
      # * ONLINEPAYMENTS_API_ENDPOINT, for example https://payment.direct.ecom.preprod.worldline-solutions.com
      # * ONLINEPAYMENTS_API_KEY_ID
      # * ONLINEPAYMENTS_SECRET_API_KEY
      # * ONLINEPAYMENTS_INTEGRATOR
      # * ONLINEPAYMENTS_CONNECT_TIMEOUT, in seconds
      # * ONLINEPAYMENTS_SOCKET_TIMEOUT, in seconds
      #
      # @param env [Hash] the environment to read from; defaults to _ENV_.
      # @return [OnlinePayments::SDK::CommunicatorConfiguration]
      # @raise [ArgumentError] if a variable is missing or has an invalid value
      def self.from_env(env = ENV)
        new(api_endpoint: required_environment_variable(env, 'ONLINEPAYMENTS_API_ENDPOINT'),
            api_key_id: required_environment_variable(env, 'ONLINEPAYMENTS_API_KEY_ID'),
            secret_api_key: required_environment_variable(env, 'ONLINEPAYMENTS_SECRET_API_KEY'),
            integrator: required_environment_variable(env, 'ONLINEPAYMENTS_INTEGRATOR'),
            connect_timeout: required_integer_environment_variable(env, 'ONLINEPAYMENTS_CONNECT_TIMEOUT'),
            socket_timeout: required_integer_environment_variable(env, 'ONLINEPAYMENTS_SOCKET_TIMEOUT'))
      end

      def self.required_environment_variable(env, name)
        value = env[name]
        raise ArgumentError, "environment variable #{name} is required" if value.nil? || value.strip.empty?

        value.strip
      end

      def self.required_integer_environment_variable(env, name)
        value = required_environment_variable(env, name)
        Integer(value, 10, exception: false) || raise(ArgumentError, "environment variable #{name} must be an integer, got '#{value}'")
      end
      private_class_method :required_environment_variable, :required_integer_environment_variable

      # @return [String] a description of this configuration in which the API key id, the secret API key and the proxy password are masked
      def inspect
        "#<#{self.class.name} api_endpoint=#{@api_endpoint.inspect}, api_key_id=#{mask(@api_key_id)}, " \
          "secret_api_key=#{mask(@secret_api_key)}, authorization_type=#{@authorization_type.inspect}, " \
          "connect_timeout=#{@connect_timeout.inspect}, socket_timeout=#{@socket_timeout.inspect}, " \
          "max_connections=#{@max_connections.inspect}, proxy_configuration=#{@proxy_configuration.inspect}, " \
          "integrator=#{@integrator.inspect}, shopping_cart_extension=#{@shopping_cart_extension.inspect}>"
      end

      alias to_s inspect

      private

      def mask(value)
        value.nil? ? 'nil' : MASK.inspect
      end

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
        scheme = 'https' if scheme.nil?
        port = -1 if port.nil?
        create_uri(scheme, host, port)
      end

      def create_uri(scheme, host, port)
        if port == -1
          "#{scheme}://#{host}"
        else
          "#{scheme}://#{host}:#{port}"
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
