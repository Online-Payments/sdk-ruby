# frozen_string_literal: true

require 'base64'
require 'etc'
require 'onlinepayments/sdk/communication/request_header'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/shopping_cart_extension'
require 'onlinepayments/sdk/json/default_marshaller'
require 'onlinepayments/sdk/version'

module OnlinePayments
  module SDK
    module Communication
      # Manages metadata about the server using the SDK
      #
      # @attr_reader [Array<OnlinePayments::SDK::Communication::RequestHeader>] metadata_headers List of headers that should be used in all requests.
      class MetadataProvider
        SDK_VERSION = OnlinePayments::SDK::VERSION
        SERVER_META_INFO_HEADER = 'X-GCS-ServerMetaInfo'
        PROHIBITED_HEADERS = [SERVER_META_INFO_HEADER, 'X-GCS-Idempotence-Key', 'Date', 'Content-Type', 'Authorization'].sort!.freeze
        CHARSET = 'utf-8'
        private_constant :SDK_VERSION, :SERVER_META_INFO_HEADER, :PROHIBITED_HEADERS, :CHARSET

        # Stores metadata about the server so it can be sent to the Online Payments platform
        class ServerMetaInfo < OnlinePayments::SDK::Domain::DataObject
          # String containing system information (Operating system and Ruby version).
          attr_accessor :platform_identifier

          # String containing this SDK version.
          attr_accessor :sdk_identifier

          attr_accessor :sdk_creator, :integrator, :shopping_cart_extension

          # Returns the values of all attributes as a hash.
          def to_h
            hash = super
            hash['platformIdentifier'] = @platform_identifier unless @platform_identifier.nil?
            hash['sdkIdentifier'] = @sdk_identifier unless @sdk_identifier.nil?
            hash['sdkCreator'] = @sdk_creator unless @sdk_creator.nil?
            hash['integrator'] = @integrator unless @integrator.nil?
            hash['shoppingCartExtension'] = @shopping_cart_extension.to_h unless @shopping_cart_extension.nil?
            hash
          end

          # Initializes the ServerMetaInfo object with properties stored in the parameter hash
          def from_hash(hash)
            super
            @platform_identifier = hash['platformIdentifier'] if hash.key? 'platformIdentifier'
            @sdk_identifier = hash['sdkIdentifier'] if hash.key? 'sdkIdentifier'
            @sdk_creator = hash['sdkCreator'] if hash.key? 'sdkCreator'
            @integrator = hash['integrator'] if hash.key? 'integrator'
            return unless hash.key? 'shoppingCartExtension'

            @shopping_cart_extension = OnlinePayments::SDK::Domain::ShoppingCartExtension.new_from_hash(hash['shoppingCartExtension'])
          end
        end

        # Create a new MetadataProvider instance that can be used to access platform-related information
        #
        # @param integrator                 [String] Name of the integrator
        # @param shopping_cart_extension    [OnlinePayments::SDK::Domain::ShoppingCartExtension] shopping cart-related metadata.
        # @param additional_request_headers [Array<OnlinePayments::SDK::Communication::RequestHeader>] list of additional headers to include in all
        #                                                                                              requests made.
        #                                   The following headers are not allowed due to conflicts with already added headers:
        #                                   'X-GCS-Idempotence-Key', 'Date', 'Content-Type', 'Authorization' and 'X-GCS-ServerMetaInfo'
        def initialize(integrator, shopping_cart_extension: nil, additional_request_headers: [].freeze)
          raise ArgumentError, 'integrator is required' if integrator.nil? || integrator.strip.empty?

          MetadataProvider.validate_additional_request_headers(additional_request_headers)
          server_meta_info = ServerMetaInfo.new
          server_meta_info.platform_identifier = platform_identifier
          server_meta_info.sdk_identifier = sdk_identifier
          server_meta_info.sdk_creator = 'OnlinePayments'
          server_meta_info.integrator = integrator
          server_meta_info.shopping_cart_extension = shopping_cart_extension unless shopping_cart_extension.nil?
          server_meta_info_string = OnlinePayments::SDK::JSON::DefaultMarshaller.instance.marshal(server_meta_info)
          server_meta_info_header = RequestHeader.new(
            SERVER_META_INFO_HEADER, Base64.strict_encode64(
                                       server_meta_info_string.force_encoding('iso-8859-1').encode(CHARSET)
                                     )
          )
          if additional_request_headers.nil? || additional_request_headers.empty?
            @metadata_headers = [server_meta_info_header].freeze
          else
            request_headers = [server_meta_info_header]
            request_headers += additional_request_headers
            @metadata_headers = request_headers.freeze
          end
        end

        # Checks that none of the {OnlinePayments::SDK::Communication::RequestHeaders} in _additional_request_headers_ is equal to any of the forbidden headers.
        # The forbidden headers are:
        # 'X-GCS-Idempotence-Key', 'Date', 'Content-Type', 'Authorization' and 'X-GCS-ServerMetaInfo'
        # If a header is found that is equal to one of the forbidden headers an ArgumentError is raised.
        def self.validate_additional_request_headers(additional_request_headers)
          return if additional_request_headers.nil?

          additional_request_headers.each do |additional_request_header|
            validate_additional_request_header(additional_request_header)
          end
        end

        # Checks that the {OnlinePayments::SDK::Communication::RequestHeaders} _additional_request_header_ is equal to any of the forbidden headers.
        # The forbidden headers are:
        # 'X-GCS-Idempotence-Key', 'Date', 'Content-Type', 'Authorization' and 'X-GCS-ServerMetaInfo'
        # If the header is equal to one of the forbidden headers an ArgumentError is raised.
        def self.validate_additional_request_header(additional_request_header)
          name = additional_request_header.name.strip
          return unless prohibited_headers.any? { |prohibited_header| prohibited_header.casecmp?(name) }

          raise ArgumentError, "request header not allowed: #{additional_request_header.name}"
        end

        protected

        # String containing information of the system using the SDK.
        # It contains data like Operating System version and Ruby version
        def platform_identifier
          "#{Etc.uname[:sysname]}/#{RUBY_DESCRIPTION}"
        end

        # String describing the version of the SDK being used
        def sdk_identifier
          "RubyServerSDK/v#{SDK_VERSION}"
        end

        public

        # Version of this SDK being used
        def self.sdk_version
          SDK_VERSION
        end

        # A {OnlinePayments::SDK::Communication::RequestHeader} that contains serialized and encoded
        # {OnlinePayments::SDK::Communication::MetadataProvider::ServerMetaInfo}.
        def self.server_meta_info_header
          SERVER_META_INFO_HEADER
        end

        # A list of header names that should not be used by any added headers.
        # These headers are reserved for specific purposes.
        def self.prohibited_headers
          PROHIBITED_HEADERS
        end

        attr_reader :metadata_headers
      end
    end
  end
end
