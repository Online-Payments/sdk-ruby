#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] asset_url
    # @attr [String] client_api_url
    # @attr [String] client_session_id
    # @attr [String] customer_id
    # @attr [Array<String>] invalid_tokens
    class SessionResponse < OnlinePayments::SDK::DataObject
      attr_accessor :asset_url
      attr_accessor :client_api_url
      attr_accessor :client_session_id
      attr_accessor :customer_id
      attr_accessor :invalid_tokens

      # @return (Hash)
      def to_h
        hash = super
        hash['assetUrl'] = @asset_url unless @asset_url.nil?
        hash['clientApiUrl'] = @client_api_url unless @client_api_url.nil?
        hash['clientSessionId'] = @client_session_id unless @client_session_id.nil?
        hash['customerId'] = @customer_id unless @customer_id.nil?
        hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
        hash
      end

      def from_hash(hash)
        super
        @asset_url = hash['assetUrl'] if hash.key? 'assetUrl'
        @client_api_url = hash['clientApiUrl'] if hash.key? 'clientApiUrl'
        @client_session_id = hash['clientSessionId'] if hash.key? 'clientSessionId'
        @customer_id = hash['customerId'] if hash.key? 'customerId'
        if hash.key? 'invalidTokens'
          raise TypeError, "value '%s' is not an Array" % [hash['invalidTokens']] unless hash['invalidTokens'].is_a? Array
          @invalid_tokens = []
          hash['invalidTokens'].each do |e|
            @invalid_tokens << e
          end
        end
      end
    end
  end
end
