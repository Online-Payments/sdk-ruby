#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/surcharge_calculation_card'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::SurchargeCalculationCard] card
    # @attr [String] encrypted_customer_input
    # @attr [String] hosted_tokenization_id
    # @attr [String] token
    class CardSource < OnlinePayments::SDK::DataObject
      attr_accessor :card
      attr_accessor :encrypted_customer_input
      attr_accessor :hosted_tokenization_id
      attr_accessor :token

      # @return (Hash)
      def to_h
        hash = super
        hash['card'] = @card.to_h if @card
        hash['encryptedCustomerInput'] = @encrypted_customer_input unless @encrypted_customer_input.nil?
        hash['hostedTokenizationId'] = @hosted_tokenization_id unless @hosted_tokenization_id.nil?
        hash['token'] = @token unless @token.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::SurchargeCalculationCard.new_from_hash(hash['card'])
        end
        @encrypted_customer_input = hash['encryptedCustomerInput'] if hash.key? 'encryptedCustomerInput'
        @hosted_tokenization_id = hash['hostedTokenizationId'] if hash.key? 'hostedTokenizationId'
        @token = hash['token'] if hash.key? 'token'
      end
    end
  end
end
