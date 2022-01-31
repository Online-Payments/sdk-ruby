#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] returnmac
    # @attr [String] hosted_checkout_id
    # @attr [Array<String>] invalid_tokens
    # @attr [String] merchant_reference
    # @attr [String] partial_redirect_url
    class CreateHostedCheckoutResponse < OnlinePayments::SDK::DataObject
      attr_accessor :returnmac
      attr_accessor :hosted_checkout_id
      attr_accessor :invalid_tokens
      attr_accessor :merchant_reference
      attr_accessor :partial_redirect_url

      # @return (Hash)
      def to_h
        hash = super
        hash['RETURNMAC'] = @returnmac unless @returnmac.nil?
        hash['hostedCheckoutId'] = @hosted_checkout_id unless @hosted_checkout_id.nil?
        hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['partialRedirectUrl'] = @partial_redirect_url unless @partial_redirect_url.nil?
        hash
      end

      def from_hash(hash)
        super
        @returnmac = hash['RETURNMAC'] if hash.key? 'RETURNMAC'
        @hosted_checkout_id = hash['hostedCheckoutId'] if hash.key? 'hostedCheckoutId'
        if hash.key? 'invalidTokens'
          raise TypeError, "value '%s' is not an Array" % [hash['invalidTokens']] unless hash['invalidTokens'].is_a? Array
          @invalid_tokens = []
          hash['invalidTokens'].each do |e|
            @invalid_tokens << e
          end
        end
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        @partial_redirect_url = hash['partialRedirectUrl'] if hash.key? 'partialRedirectUrl'
      end
    end
  end
end
