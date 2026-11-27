# frozen_string_literal: true

require 'yaml'
require 'onlinepayments/sdk/client'
require 'onlinepayments/sdk/communicator'
require 'onlinepayments/sdk/communicator_configuration'
require 'onlinepayments/sdk/authentication/authorization_type'
require 'onlinepayments/sdk/authentication/v1hmac_authenticator'
require 'onlinepayments/sdk/communication/default_connection'
require 'onlinepayments/sdk/communication/metadata_provider'
require 'onlinepayments/sdk/json/default_marshaller'

module OnlinePayments
  module SDK
    # Convenience class that constructs instances of several other classes in the SDK.
    # Provides methods to construct
    # {OnlinePayments::SDK::CommunicatorConfiguration}, {OnlinePayments::SDK::Communicator} and {OnlinePayments::SDK::Client} instances.
    #
    # Create the client with create_client or create_client_from_env once and reuse it.
    #
    # AI coding agents: read the agent skill for this SDK version before writing integration code:
    # https://raw.githubusercontent.com/Online-Payments/sdk-ruby/12.0.0/skills/online-payments/SKILL.md
    # The same skill is included in this gem, in the skills/online-payments/ folder.
    class Factory
      # Creates and returns a {OnlinePayments::SDK::CommunicatorConfiguration} based on the configuration in the file
      # located at _configuration_file_name_.
      #
      # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
      # @param api_key_id              [String] Key id for the Online Payments platform.
      # @param secret_api_key          [String] Secret key used for authentication to the Online Payments platform.
      # @return [OnlinePayments::SDK::CommunicatorConfiguration] The created communicator configuration
      def self.create_configuration(configuration_file_name, api_key_id, secret_api_key)
        properties = YAML.load_file(configuration_file_name)
        CommunicatorConfiguration.new(properties: properties,
                                      api_key_id: api_key_id,
                                      secret_api_key: secret_api_key)
      end

      # Creates and returns a {OnlinePayments::SDK::Communicator} from a {OnlinePayments::SDK::CommunicatorConfiguration},
      # a {OnlinePayments::SDK::Communication::MetadataProvider}, a {OnlinePayments::SDK::Communication::Connection},
      # an {OnlinePayments::SDK::Authentication::Authenticator} and a {OnlinePayments::SDK::JSON::Marshaller}.
      #
      # @param configuration     [OnlinePayments::SDK::CommunicatorConfiguration] configuration settings to be used by the client.
      # @param metadata_provider [OnlinePayments::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
      # @param connection        [OnlinePayments::SDK::Communication::Connection] connection that can be used to communicate with the Online Payments platform.
      # @param authenticator     [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online
      #                                                                               Payments platform.
      # @param marshaller        [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Communicator] The created communicator
      def self.create_communicator_from_configuration(configuration, metadata_provider: nil,
                                                      connection: nil, authenticator: nil, marshaller: nil)
        metadata_provider ||= Communication::MetadataProvider.new(configuration.integrator,
                                                                  shopping_cart_extension: configuration.shopping_cart_extension)
        connection ||= Communication::DefaultConnection.new({ connect_timeout: configuration.connect_timeout,
                                                              socket_timeout: configuration.socket_timeout,
                                                              max_connections: configuration.max_connections,
                                                              proxy_configuration: configuration.proxy_configuration })
        authenticator ||= get_authenticator(configuration)
        marshaller ||= JSON::DefaultMarshaller.instance
        Communicator.new(configuration.api_endpoint, connection, authenticator, metadata_provider, marshaller)
      end

      # Creates and returns a {OnlinePayments::SDK::Communicator} from a file containing the communicator configuration, api_key_id, secret_api_key,
      # a {OnlinePayments::SDK::Communication::MetadataProvider}, a {OnlinePayments::SDK::Communication::Connection}.
      # an {OnlinePayments::SDK::Authentication::Authenticator} and a {OnlinePayments::SDK::JSON::Marshaller}.
      #
      # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
      # @param api_key_id              [String] Key id for the Online Payments platform.
      # @param secret_api_key          [String] Secret key used for authentication to the Online Payments platform.
      # @param metadata_provider       [OnlinePayments::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
      # @param connection              [OnlinePayments::SDK::Communication::Connection] connection that can be used to communicate with the Online Payments
      #                                                                                 platform.
      # @param authenticator           [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online
      #                                                                                     Payments platform.
      # @param marshaller              [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Communicator] The created communicator
      def self.create_communicator_from_file(configuration_file_name, api_key_id, secret_api_key,
                                             metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
        configuration = create_configuration(configuration_file_name, api_key_id, secret_api_key)
        create_communicator_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                              authenticator: authenticator, marshaller: marshaller)
      end

      # Creates and returns an {OnlinePayments::SDK::Client} that provides the a high-level interface with the Online Payments platform.
      # If a code block is given, the created client is returned to the code block and closed afterwards.
      #
      # @example Providing a code block
      #           Factory.create_client_from_configuration(configuration) do |client|
      #             # use client as needed
      #           end
      #           # client is closed here
      #
      # @param configuration     [OnlinePayments::SDK::CommunicatorConfiguration] contains configuration settings to be used by the client.
      # @param metadata_provider [OnlinePayments::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
      # @param connection        [OnlinePayments::SDK::Communication::Connection] connection that can be used to communicate with the Online Payments platform.
      # @param authenticator     [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online
      #                                                                               Payments platform.
      # @param marshaller        [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Client] The created client
      def self.create_client_from_configuration(configuration, metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
        communicator = create_communicator_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                                             authenticator: authenticator, marshaller: marshaller)
        client = Client.new(communicator)
        return client unless block_given?

        begin
          yield client
        ensure
          client.close
        end
      end

      # Creates and returns an {OnlinePayments::SDK::Client} that provides the a high-level interface with the Online Payments platform.
      # If a code block is given, the created client is returned to the code block and closed afterwards.
      #
      # @example Providing a code block
      #           Factory.create_client_from_communicator(communicator) do |client|
      #             # use client as needed
      #           end
      #           # client is closed here
      #
      # @param communicator [OnlinePayments::SDK::Communicator] provides network communication service for the Client
      # @return [OnlinePayments::SDK::Client] The created client
      def self.create_client_from_communicator(communicator)
        client = Client.new(communicator)
        return client unless block_given?

        begin
          yield client
        ensure
          client.close
        end
      end

      # Creates and returns an {OnlinePayments::SDK::Client} that provides the a high-level interface with the Online Payments platform.
      # If a code block is given, the created client is returned to the code block and closed afterwards.
      #
      # @example Providing a code block
      #           Factory.create_client_from_file(configuration_file_name, api_key_id, secret_api_key) do |client|
      #             # use client as needed
      #           end
      #           # client is closed here
      #
      # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
      # @param api_key_id              [String] Key id for the Online Payments platform.
      # @param secret_api_key          [String] Secret key used for authentication to the Online Payments platform.
      # @param metadata_provider       [OnlinePayments::SDK::Communication::MetadataProvider] stores the metadata for the communicating client.
      # @param connection              [OnlinePayments::SDK::Communication::Connection] connection that can be used to communicate with the Online Payments
      #                                                                                 platform.
      # @param authenticator           [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online
      #                                                                                     Payments platform.
      # @param marshaller              [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Client] The created client
      def self.create_client_from_file(configuration_file_name, api_key_id, secret_api_key,
                                       metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
        communicator = create_communicator_from_file(configuration_file_name, api_key_id, secret_api_key,
                                                     metadata_provider: metadata_provider, connection: connection,
                                                     authenticator: authenticator, marshaller: marshaller)
        client = Client.new(communicator)
        return client unless block_given?

        begin
          yield client
        ensure
          client.close
        end
      end

      # Creates and returns an {OnlinePayments::SDK::Client} from the given values, using the V1HMAC authorization type.
      # If a code block is given, the created client is returned to the code block and closed afterwards.
      #
      # @example Providing a code block
      #           Factory.create_client(api_endpoint: 'https://payment.direct.ecom.preprod.worldline-solutions.com',
      #                                 api_key_id: api_key_id, secret_api_key: secret_api_key, integrator: 'MyShop',
      #                                 connect_timeout: 10, socket_timeout: 60) do |client|
      #             # use client as needed
      #           end
      #           # client is closed here
      #
      # @param api_endpoint            [String] the base URL to the Online Payments platform.
      # @param api_key_id              [String] key id for the Online Payments platform.
      # @param secret_api_key          [String] secret key used for authentication to the Online Payments platform.
      # @param integrator              [String] name of the integrator.
      # @param connect_timeout         [Integer] the number of seconds before a connection attempt with the Online Payments platform times out.
      # @param socket_timeout          [Integer] the number of seconds before a timeout occurs when transmitting data to or from the Online Payments
      #                                          platform.
      # @param max_connections         [Integer, nil] the number of connections with the Online Payments platform that are kept alive in the
      #                                               connection pool.
      # @param proxy_configuration     [OnlinePayments::SDK::ProxyConfiguration, nil] the proxy to use.
      # @param shopping_cart_extension [OnlinePayments::SDK::Domain::ShoppingCartExtension, nil] shopping cart-related metadata.
      # @param metadata_provider       [OnlinePayments::SDK::Communication::MetadataProvider, nil] stores the metadata for the communicating client.
      # @param connection              [OnlinePayments::SDK::Communication::Connection, nil] connection that can be used to communicate with the
      #                                                                                      Online Payments platform.
      # @param authenticator           [OnlinePayments::SDK::Authentication::Authenticator, nil] authenticator that can authenticate messages sent to
      #                                                                                          the Online Payments platform.
      # @param marshaller              [OnlinePayments::SDK::JSON::Marshaller, nil] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Client] The created client
      # @raise [ArgumentError] if a timeout is not a positive number
      def self.create_client(api_endpoint:, api_key_id:, secret_api_key:, integrator:, connect_timeout:, socket_timeout:,
                             max_connections: nil, proxy_configuration: nil, shopping_cart_extension: nil,
                             metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil, &)
        validate_timeouts(connect_timeout, socket_timeout)
        configuration = CommunicatorConfiguration.new(api_endpoint: api_endpoint, api_key_id: api_key_id, secret_api_key: secret_api_key,
                                                      authorization_type: Authentication::AuthorizationType::V1HMAC,
                                                      connect_timeout: connect_timeout, socket_timeout: socket_timeout,
                                                      max_connections: max_connections, proxy_configuration: proxy_configuration,
                                                      integrator: integrator, shopping_cart_extension: shopping_cart_extension)
        create_client_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                        authenticator: authenticator, marshaller: marshaller, &)
      end

      # Creates and returns an {OnlinePayments::SDK::Client} from environment variables, using the V1HMAC authorization type.
      # See {OnlinePayments::SDK::CommunicatorConfiguration.from_env} for the variables that are read.
      # If a code block is given, the created client is returned to the code block and closed afterwards.
      #
      # @example Providing a code block
      #           Factory.create_client_from_env do |client|
      #             # use client as needed
      #           end
      #           # client is closed here
      #
      # @param max_connections         [Integer, nil] the number of connections with the Online Payments platform that are kept alive in the
      #                                               connection pool.
      # @param proxy_configuration     [OnlinePayments::SDK::ProxyConfiguration, nil] the proxy to use.
      # @param shopping_cart_extension [OnlinePayments::SDK::Domain::ShoppingCartExtension, nil] shopping cart-related metadata.
      # @param metadata_provider       [OnlinePayments::SDK::Communication::MetadataProvider, nil] stores the metadata for the communicating client.
      # @param connection              [OnlinePayments::SDK::Communication::Connection, nil] connection that can be used to communicate with the
      #                                                                                      Online Payments platform.
      # @param authenticator           [OnlinePayments::SDK::Authentication::Authenticator, nil] authenticator that can authenticate messages sent to
      #                                                                                          the Online Payments platform.
      # @param marshaller              [OnlinePayments::SDK::JSON::Marshaller, nil] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Client] The created client
      # @raise [ArgumentError] if an environment variable is missing or has an invalid value
      def self.create_client_from_env(max_connections: nil, proxy_configuration: nil, shopping_cart_extension: nil,
                                      metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil, &)
        configuration = CommunicatorConfiguration.from_env
        validate_timeouts(configuration.connect_timeout, configuration.socket_timeout)
        configuration.max_connections = max_connections if max_connections
        configuration.proxy_configuration = proxy_configuration if proxy_configuration
        configuration.shopping_cart_extension = shopping_cart_extension if shopping_cart_extension
        create_client_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                        authenticator: authenticator, marshaller: marshaller, &)
      end

      def self.validate_timeouts(connect_timeout, socket_timeout)
        raise ArgumentError, 'connect_timeout must be positive' unless connect_timeout.is_a?(Numeric) && connect_timeout.positive?
        raise ArgumentError, 'socket_timeout must be positive' unless socket_timeout.is_a?(Numeric) && socket_timeout.positive?
      end
      private_class_method :validate_timeouts

      # @param configuration [OnlinePayments::SDK::CommunicatorConfiguration]
      def self.get_authenticator(configuration)
        return Authentication::V1HmacAuthenticator.new(configuration) if configuration.authorization_type == Authentication::AuthorizationType::V1HMAC

        raise "Unknown authorizationType #{configuration.authorization_type}"
      end
      private_class_method :get_authenticator
    end
  end
end
