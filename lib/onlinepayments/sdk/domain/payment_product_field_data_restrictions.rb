#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_validators'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] is_required
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldValidators] validators
      class PaymentProductFieldDataRestrictions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :is_required

        attr_accessor :validators

        # @return (Hash)
        def to_h
          hash = super
          hash['isRequired'] = @is_required unless @is_required.nil?
          hash['validators'] = @validators.to_h unless @validators.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'isRequired'
            @is_required = hash['isRequired']
          end
          if hash.has_key? 'validators'
            raise TypeError, "value '%s' is not a Hash" % [hash['validators']] unless hash['validators'].is_a? Hash
            @validators = OnlinePayments::SDK::Domain::PaymentProductFieldValidators.new_from_hash(hash['validators'])
          end
        end
      end
    end
  end
end
