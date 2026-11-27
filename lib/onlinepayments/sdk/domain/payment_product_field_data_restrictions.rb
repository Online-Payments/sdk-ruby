# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_validators'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] is_required
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldValidators, nil] validators
      class PaymentProductFieldDataRestrictions < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :is_required

        attr_accessor :validators

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(is_required: nil, validators: nil)
          super()
          @is_required = is_required
          @validators = validators
        end

        # Sets the property and returns this same instance.
        def with_is_required(value)
          @is_required = value
          self
        end

        # Sets the property and returns this same instance.
        def with_validators(value)
          @validators = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['isRequired'] = @is_required unless @is_required.nil?
          hash['validators'] = @validators.to_h unless @validators.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'isRequired'
            @is_required = hash['isRequired']
          end
          if hash.key? 'validators'
            raise TypeError, "value '#{hash['validators']}' is not a Hash" unless hash['validators'].is_a? Hash
            @validators = OnlinePayments::SDK::Domain::PaymentProductFieldValidators.new_from_hash(hash['validators'])
          end
        end
      end
    end
  end
end
