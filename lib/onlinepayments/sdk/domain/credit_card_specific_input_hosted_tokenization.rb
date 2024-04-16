#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/credit_card_validation_rules_hosted_tokenization'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CreditCardValidationRulesHostedTokenization] validation_rules
    # @attr [Array<Integer>] payment_product_preferred_order
    class CreditCardSpecificInputHostedTokenization < OnlinePayments::SDK::DataObject
      attr_accessor :validation_rules
      attr_accessor :payment_product_preferred_order

      # @return (Hash)
      def to_h
        hash = super
        hash['ValidationRules'] = @validation_rules.to_h if @validation_rules
        hash['paymentProductPreferredOrder'] = @payment_product_preferred_order unless @payment_product_preferred_order.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'ValidationRules'
          raise TypeError, "value '%s' is not a Hash" % [hash['ValidationRules']] unless hash['ValidationRules'].is_a? Hash
          @validation_rules = OnlinePayments::SDK::Domain::CreditCardValidationRulesHostedTokenization.new_from_hash(hash['ValidationRules'])
        end
        if hash.key? 'paymentProductPreferredOrder'
          raise TypeError, "value '%s' is not an Array" % [hash['paymentProductPreferredOrder']] unless hash['paymentProductPreferredOrder'].is_a? Array
          @payment_product_preferred_order = []
          hash['paymentProductPreferredOrder'].each do |e|
            @payment_product_preferred_order << e
          end
        end
      end
    end
  end
end
