# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] extra_merchant_data
      class RedirectPaymentProduct3306SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :extra_merchant_data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(extra_merchant_data: nil)
          super()
          @extra_merchant_data = extra_merchant_data
        end

        # Sets the property and returns this same instance.
        def with_extra_merchant_data(value)
          @extra_merchant_data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['extraMerchantData'] = @extra_merchant_data unless @extra_merchant_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'extraMerchantData'
            @extra_merchant_data = hash['extraMerchantData']
          end
        end
      end
    end
  end
end
