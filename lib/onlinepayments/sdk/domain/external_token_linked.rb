# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] computed_token
      # @attr [String, nil] gts_computed_token
      # @attr [String, nil] generated_token
      class ExternalTokenLinked < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :computed_token

        # @deprecated Use the field ComputedToken instead.
        attr_accessor :gts_computed_token

        attr_accessor :generated_token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(computed_token: nil, gts_computed_token: nil, generated_token: nil)
          super()
          @computed_token = computed_token
          @gts_computed_token = gts_computed_token
          @generated_token = generated_token
        end

        # Sets the property and returns this same instance.
        def with_computed_token(value)
          @computed_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_gts_computed_token(value)
          @gts_computed_token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_generated_token(value)
          @generated_token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['ComputedToken'] = @computed_token unless @computed_token.nil?
          hash['GTSComputedToken'] = @gts_computed_token unless @gts_computed_token.nil?
          hash['GeneratedToken'] = @generated_token unless @generated_token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'ComputedToken'
            @computed_token = hash['ComputedToken']
          end
          if hash.key? 'GTSComputedToken'
            @gts_computed_token = hash['GTSComputedToken']
          end
          if hash.key? 'GeneratedToken'
            @generated_token = hash['GeneratedToken']
          end
        end
      end
    end
  end
end
