#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] authorization_mode
      # @attr [String] subsequent_type
      class SubsequentPaymentProduct5001SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorization_mode

        attr_accessor :subsequent_type

        # @return (Hash)
        def to_h
          hash = super
          hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
          hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'authorizationMode'
            @authorization_mode = hash['authorizationMode']
          end
          if hash.has_key? 'subsequentType'
            @subsequent_type = hash['subsequentType']
          end
        end
      end
    end
  end
end
