# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product130_specific_three_d_secure'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct130SpecificThreeDSecure, nil] three_d_secure
      class PaymentProduct130SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :three_d_secure

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(three_d_secure: nil)
          super()
          @three_d_secure = three_d_secure
        end

        # Sets the property and returns this same instance.
        def with_three_d_secure(value)
          @three_d_secure = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['threeDSecure'] = @three_d_secure.to_h unless @three_d_secure.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'threeDSecure'
            raise TypeError, "value '#{hash['threeDSecure']}' is not a Hash" unless hash['threeDSecure'].is_a? Hash
            @three_d_secure = OnlinePayments::SDK::Domain::PaymentProduct130SpecificThreeDSecure.new_from_hash(hash['threeDSecure'])
          end
        end
      end
    end
  end
end
