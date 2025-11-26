require 'openssl'
require 'base64'

require 'onlinepayments/sdk/authentication/authenticator'
require 'onlinepayments/sdk/communication/default_connection'
require 'onlinepayments/sdk/communication/request_header'

module OnlinePayments
  module SDK
    module Authentication
      # Authenticates requests made to the Online Payments platform using V1Hmac.
      class V1HmacAuthenticator < Authenticator

        # HMAC algorithm used to generate the signature
        HMAC_ALGOR = 'SHA256'.freeze
        CONTENT_TYPE = 'Content-Type'.freeze
        DATE = 'Date'.freeze
        XGCS = 'X-GCS'.freeze
        XGCS_LOWER = XGCS.downcase.freeze

        # Constructs a new V1HmacAuthenticator instance using the provided CommunicatorConfiguration.
        #
        # @param communicator_configuration [OnlinePayments::SDK::CommunicatorConfiguration] The configuration object
        #                                   containing the V1Hmac authorization id and authorization secret,
        #                                   connection timeout, and socket timeout. None of these can be _nil_ or empty,
        #                                   and the timeout values must be positive.
        def initialize(communicator_configuration)
          raise ArgumentError unless communicator_configuration.api_key_id and not communicator_configuration.api_key_id.strip.empty?
          raise ArgumentError unless communicator_configuration.secret_api_key and not communicator_configuration.secret_api_key.strip.empty?

          @api_key_id = communicator_configuration.api_key_id
          @secret_api_key = communicator_configuration.secret_api_key
          @authorization_type = communicator_configuration.authorization_type
        end

        # @param http_method     [String, nil] 'GET', 'PUT', 'POST' or 'DELETE' indicating which HTTP method will be used with the request
        # @param resource_uri    [URI::HTTP, nil] URI object that includes #path and #query of the URL that will be used, #query may be *nil*
        # @param request_headers [Array<OnlinePayments::SDK::Communication::RequestHeader>, nil] all headers used by the request
        def get_authorization(http_method, resource_uri, request_headers)
          raise ArgumentError unless http_method && !http_method.strip.empty?
          raise ArgumentError unless resource_uri

          data_to_sign = to_data_to_sign(http_method, resource_uri, request_headers)
          "GCS #{@authorization_type}:#{@api_key_id}:#{create_auth_signature(data_to_sign)}"
        end

        protected

        # Canonizes the _http_method_, _resource_uri_ and _http_headers_ so a unique signature can be generated.
        # Canonical form is as follows:
        # * _http_method_ in upper case
        # * Content-Type
        # * Date header
        # * X-GCS headers sorted alphabetically. Names are in lowercase and values are stripped of excess whitespace
        # * path and query portion of the uri, separated by a question mark
        def to_data_to_sign(http_method, resource_uri, http_headers)
          content_type = ''
          date = ''
          canonical_resource = to_canonical_resource(resource_uri)
          xgc_http_headers = []

          http_headers&.each do |header|
            name = header.name
            value = header.value
            case
            when name.casecmp(CONTENT_TYPE).zero?
              content_type = value
            when name.casecmp(DATE).zero?
              date = value
            when to_canonical_header_name(name).start_with?(XGCS_LOWER)
              xgc_http_headers << [to_canonical_header_name(name), to_canonical_header_value(value)]
            end
          end

          xgc_http_headers.sort! { |(h1, v1), (h2, v2)| h1 <=> h2 } unless xgc_http_headers.empty?

          data = "#{http_method.upcase}\n#{content_type}\n#{date}\n"
          data << xgc_http_headers.inject('') { |s, (k, v)| "#{s}#{k}:#{v}\n" } unless xgc_http_headers.empty?
          data << "#{canonical_resource}\n" if canonical_resource
        end

        # Applies the HMAC algorithm to the canonicalized data to obtain an HMAC digest.
        # Afterwards the HMAC digest is encoded using base64 encoding.
        def create_auth_signature(data_to_sign)
          digest = OpenSSL::Digest.new(HMAC_ALGOR)
          hmac = OpenSSL::HMAC.digest(digest, @secret_api_key, data_to_sign)
          Base64.strict_encode64(hmac).strip
        end

        private

        # Returns the encoded URI path without the HTTP method and including all decoded query parameters.
        def to_canonical_resource(resource_uri)
          return "#{resource_uri.path}?#{resource_uri.query}" if resource_uri.query
          resource_uri.path
        end

        def to_canonical_header_name(original_name)
          original_name ? original_name.downcase : original_name
        end

        # Strips a header value of excess whitespace to produce a canonical value
        def to_canonical_header_value(original_value)
          return '' unless original_value
          original_value.gsub(/\r?\n[\s&&[^\r\n]]*/, ' ').strip
        end
      end
    end
  end
end
