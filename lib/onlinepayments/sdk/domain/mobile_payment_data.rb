# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] dpan
      # @attr [String, nil] expiry_date
      class MobilePaymentData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dpan

        attr_accessor :expiry_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(dpan: nil, expiry_date: nil)
          super()
          @dpan = dpan
          @expiry_date = expiry_date
        end

        # Sets the property and returns this same instance.
        def with_dpan(value)
          @dpan = value
          self
        end

        # Sets the property and returns this same instance.
        def with_expiry_date(value)
          @expiry_date = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['dpan'] = @dpan unless @dpan.nil?
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'dpan'
            @dpan = hash['dpan']
          end
          if hash.key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
        end
      end
    end
  end
end
