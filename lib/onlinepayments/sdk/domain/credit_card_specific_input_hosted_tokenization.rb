#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/credit_card_validation_rules_hosted_tokenization'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CreditCardValidationRulesHostedTokenization] validation_rules
    class CreditCardSpecificInputHostedTokenization < OnlinePayments::SDK::DataObject
      attr_accessor :validation_rules

      # @return (Hash)
      def to_h
        hash = super
        hash['ValidationRules'] = @validation_rules.to_h if @validation_rules
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'ValidationRules'
          raise TypeError, "value '%s' is not a Hash" % [hash['ValidationRules']] unless hash['ValidationRules'].is_a? Hash
          @validation_rules = OnlinePayments::SDK::Domain::CreditCardValidationRulesHostedTokenization.new_from_hash(hash['ValidationRules'])
        end
      end
    end
  end
end
