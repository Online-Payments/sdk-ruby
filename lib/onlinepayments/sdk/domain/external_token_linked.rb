#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] computed_token
      # @attr [String] gts_computed_token
      # @attr [String] generated_token
      class ExternalTokenLinked < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :computed_token

        # @deprecated Use the field ComputedToken instead.
        attr_accessor :gts_computed_token

        attr_accessor :generated_token

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
          if hash.has_key? 'ComputedToken'
            @computed_token = hash['ComputedToken']
          end
          if hash.has_key? 'GTSComputedToken'
            @gts_computed_token = hash['GTSComputedToken']
          end
          if hash.has_key? 'GeneratedToken'
            @generated_token = hash['GeneratedToken']
          end
        end
      end
    end
  end
end
