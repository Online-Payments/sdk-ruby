# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] eligibility
      # @attr [String, nil] type
      class ProtectionEligibility < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :eligibility

        attr_accessor :type

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(eligibility: nil, type: nil)
          super()
          @eligibility = eligibility
          @type = type
        end

        # Sets the property and returns this same instance.
        def with_eligibility(value)
          @eligibility = value
          self
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['eligibility'] = @eligibility unless @eligibility.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'eligibility'
            @eligibility = hash['eligibility']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
