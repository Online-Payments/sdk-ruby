#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/credit_card_validation_rules_hosted_tokenization'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CreditCardValidationRulesHostedTokenization] validation_rules
      # @attr [Array<Integer>] payment_product_preferred_order
      class CreditCardSpecificInputHostedTokenization < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :validation_rules

        attr_accessor :payment_product_preferred_order

        # @return (Hash)
        def to_h
          hash = super
          hash['ValidationRules'] = @validation_rules.to_h unless @validation_rules.nil?
          hash['paymentProductPreferredOrder'] = @payment_product_preferred_order unless @payment_product_preferred_order.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'ValidationRules'
            raise TypeError, "value '%s' is not a Hash" % [hash['ValidationRules']] unless hash['ValidationRules'].is_a? Hash
            @validation_rules = OnlinePayments::SDK::Domain::CreditCardValidationRulesHostedTokenization.new_from_hash(hash['ValidationRules'])
          end
          if hash.has_key? 'paymentProductPreferredOrder'
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
end
