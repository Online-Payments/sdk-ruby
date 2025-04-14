#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] eligibility
      # @attr [String] type
      class ProtectionEligibility < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :eligibility

        attr_accessor :type

        # @return (Hash)
        def to_h
          hash = super
          hash['eligibility'] = @eligibility unless @eligibility.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'eligibility'
            @eligibility = hash['eligibility']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
