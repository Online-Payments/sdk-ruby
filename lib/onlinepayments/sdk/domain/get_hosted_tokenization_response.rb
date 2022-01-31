#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/token_response'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::TokenResponse] token
    # @attr [String] token_status
    class GetHostedTokenizationResponse < OnlinePayments::SDK::DataObject
      attr_accessor :token
      attr_accessor :token_status

      # @return (Hash)
      def to_h
        hash = super
        hash['token'] = @token.to_h if @token
        hash['tokenStatus'] = @token_status unless @token_status.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'token'
          raise TypeError, "value '%s' is not a Hash" % [hash['token']] unless hash['token'].is_a? Hash
          @token = OnlinePayments::SDK::Domain::TokenResponse.new_from_hash(hash['token'])
        end
        @token_status = hash['tokenStatus'] if hash.key? 'tokenStatus'
      end
    end
  end
end
