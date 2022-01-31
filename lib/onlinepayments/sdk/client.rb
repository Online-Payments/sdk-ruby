#
# This class was auto-generated.
#
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/logging/logging_capable'
require 'onlinepayments/sdk/merchant/merchant_client'
require 'base64'

module OnlinePayments
  module SDK
    # payment platform client.
    #
    # This client and all its child clients are bound to one specific value for the X-GCS-ClientMetaInfo header.
    #
    # To get a new client with a different header value, use with_client_meta_info.
    #
    # Thread safe.
    class Client < ApiResource
      include Logging::LoggingCapable

      # @return [String]
      def self.API_VERSION
        'v2'
      end

      # @param communicator     [OnlinePayments::SDK::Communicator]
      # @param client_meta_info [String, nil]
      def initialize(communicator, client_meta_info = nil)
        super(communicator, nil, client_meta_info)
      end

      # @param client_meta_info [String, nil] JSON string containing the meta data for the client
      # @return [OnlinePayments::SDK::Client] a Client which uses the passed meta data for the X-GCS-ClientMetaInfo header.
      # @raise [OnlinePayments::SDK::MarshallerSyntaxException] if the given clientMetaInfo is not a valid JSON string
      def with_client_meta_info(client_meta_info)
        if client_meta_info
          # Checking to see if this is valid JSON (no JSON parse exceptions)
          @communicator.marshaller.unmarshal(client_meta_info, DataObject)
          client_meta_info = Base64.strict_encode64(client_meta_info)
          return @client_meta_info == client_meta_info ? self : Client.new(@communicator, client_meta_info)
        end
        @client_meta_info ? Client.new(@communicator) : self
      end

      # Utility method that delegates the call to this client's communicator.
      def close_idle_connections(idle_time)
        @communicator.close_idle_connections(idle_time)
      end

      # Utility method that delegates the call to this client's communicator.
      def close_expired_connections
        @communicator.close_expired_connections
      end

      # Turns on logging using the given communicator logger.
      # @param communicator_logger [OnlinePayments::SDK::Logging::CommunicatorLogger]
      def enable_logging(communicator_logger)
        @communicator.enable_logging(communicator_logger)
      end

      # Turns off logging.
      def disable_logging
        @communicator.disable_logging
      end

      # Releases any system resources associated with this object.
      def close
        @communicator.close
      end

      # Resource /v2/!{merchantId}
      # @param merchant_id [String]
      # @return [OnlinePayments::SDK::Merchant::MerchantClient]
      def merchant(merchant_id)
        OnlinePayments::SDK::Merchant::MerchantClient.new(self, {
          'merchantId'.freeze => merchant_id
        })
      end
    end
  end
end
