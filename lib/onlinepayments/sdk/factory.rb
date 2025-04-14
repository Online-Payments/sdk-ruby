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
    class Factory

      # Creates and returns a {OnlinePayments::SDK::CommunicatorConfiguration} based on the configuration in the file
      # located at _configuration_file_name_.
      #
      # @param configuration_file_name [String] Path to the configuration file to use, should be in YAML format.
      # @param api_key_id              [String] Key id for the Online Payments platform.
      # @param secret_api_key          [String] Secret key used for authentication to the Online Payments platform.
      # @return [OnlinePayments::SDK::CommunicatorConfiguration] The created communicator configuration
      def self.create_configuration(configuration_file_name, api_key_id, secret_api_key)
        properties = YAML::load_file(configuration_file_name)
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
      # @param authenticator     [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online Payments platform.
      # @param marshaller        [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Communicator] The created communicator
      def self.create_communicator_from_configuration(configuration, metadata_provider: nil,
                                                      connection: nil, authenticator: nil, marshaller: nil)
        unless metadata_provider
          metadata_provider = Communication::MetadataProvider.new(configuration.integrator,
                                                    shopping_cart_extension: configuration.shopping_cart_extension)
        end
        unless connection
          connection = Communication::DefaultConnection.new({ connect_timeout: configuration.connect_timeout,
                                                              socket_timeout: configuration.socket_timeout,
                                                              max_connections: configuration.max_connections,
                                                              proxy_configuration: configuration.proxy_configuration })
        end
        unless authenticator
          authenticator = get_authenticator(configuration)
        end
        unless marshaller
          marshaller = JSON::DefaultMarshaller.instance
        end
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
      # @param connection              [OnlinePayments::SDK::Communication::Connection] connection that can be used to communicate with the Online Payments platform.
      # @param authenticator           [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online Payments platform.
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
      # @param authenticator     [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online Payments platform.
      # @param marshaller        [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Client] The created client
      def self.create_client_from_configuration(configuration, metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
        communicator = create_communicator_from_configuration(configuration, metadata_provider: metadata_provider, connection: connection,
                                                              authenticator: authenticator, marshaller: marshaller)
        client = Client.new(communicator)
        if block_given?
          begin
            yield client
          ensure
            client.close
          end
        else
          return client
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
        if block_given?
          begin
            yield client
          ensure
            client.close
          end
        else
          return client
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
      # @param connection              [OnlinePayments::SDK::Communication::Connection] connection that can be used to communicate with the Online Payments platform.
      # @param authenticator           [OnlinePayments::SDK::Authentication::Authenticator] authenticator that can authenticate messages sent to the Online Payments platform.
      # @param marshaller              [OnlinePayments::SDK::JSON::Marshaller] marshaller that can marshal and unmarshal objects to and from JSON.
      # @return [OnlinePayments::SDK::Client] The created client
      def self.create_client_from_file(configuration_file_name, api_key_id, secret_api_key,
                                       metadata_provider: nil, connection: nil, authenticator: nil, marshaller: nil)
        communicator = create_communicator_from_file(configuration_file_name, api_key_id, secret_api_key,
                                                     metadata_provider: metadata_provider, connection: connection,
                                                     authenticator: authenticator, marshaller: marshaller)
        client = Client.new(communicator)
        if block_given?
          begin
            yield client
          ensure
            client.close
          end
        else
          return client
        end
      end

      private

      # @param configuration [OnlinePayments::SDK::CommunicatorConfiguration]
      def self.get_authenticator(configuration)
        if configuration.authorization_type == Authentication::AuthorizationType::V1HMAC
          return Authentication::V1HmacAuthenticator.new(configuration)
        end
        raise RuntimeError.new("Unknown authorizationType #{configuration.authorization_type}")
      end
    end
  end
end
