#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] exemption_request
      # @attr [String] subsequent_type
      class RedirectPaymentProduct5001SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :exemption_request

        attr_accessor :subsequent_type

        # @return (Hash)
        def to_h
          hash = super
          hash['exemptionRequest'] = @exemption_request unless @exemption_request.nil?
          hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'exemptionRequest'
            @exemption_request = hash['exemptionRequest']
          end
          if hash.has_key? 'subsequentType'
            @subsequent_type = hash['subsequentType']
          end
        end
      end
    end
  end
end
