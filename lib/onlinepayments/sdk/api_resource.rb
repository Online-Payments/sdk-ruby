require 'onlinepayments/sdk/communication/request_header'

module OnlinePayments
  module SDK
    # Base class of all Online Payments platform API resources.
    # Provides shared functionality to facilitate communication with the Online Payments platform.
    #
    # @attr_reader [OnlinePayments::SDK::Communicator] communicator Communicator instance that provides communication with the Online Payments platform.
    # @attr_reader [String] client_meta_info JSON string containing client info specific to the current client.
    class ApiResource

      # Creates a new ApiResource.
      #
      # @param parent           [OnlinePayments::SDK::ApiResource] parent resource instance.
      # @param communicator     [OnlinePayments::SDK::Communicator] Communicator instance.
      # @param path_context     [Hash] hash that contains substitutions for generic locations in the URL path.
      #                         This hash will be used to instantiate a concrete URL used to access specific resources.
      # @param client_meta_info [String] JSON string containing the metadata for the client.
      def initialize(parent: nil, communicator: nil, path_context: nil, client_meta_info: nil)
        raise ArgumentError.new('parent and/or communicator is required') if parent.nil? and communicator.nil?
        @parent = parent
        @communicator = communicator.nil? ? parent.communicator : communicator
        @path_context = path_context
        @client_meta_info = client_meta_info || parent.nil? ? client_meta_info : parent.client_meta_info
      end

      attr_reader :communicator
      attr_reader :client_meta_info

      protected

      # @return [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] the client headers,
      #         including the X-GCS-ClientMetaInfo header if metadata for the client is available
      def client_headers
        if @client_meta_info.nil?
          nil
        else
          [Communication::RequestHeader.new('X-GCS-ClientMetaInfo', @client_meta_info)]
        end
      end

      def instantiate_uri(uri, path_context = nil)
        if path_context
          uri = replace_all(uri, path_context)
          instantiate_uri(uri)
        else
          uri = replace_all(uri, @path_context)
          unless @parent.nil?
            uri = @parent.instantiate_uri(uri)
          end
          uri
        end
      end

      private

      def replace_all(uri, path_context)
        if path_context
          path_context.each do |key, value|
            uri = uri.gsub('{' + key + '}', value)
          end
        end
        uri
      end
    end
  end
end
