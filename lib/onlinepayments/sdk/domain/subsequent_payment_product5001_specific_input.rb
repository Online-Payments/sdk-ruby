#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] subsequent_type
      class SubsequentPaymentProduct5001SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :subsequent_type

        # Sets the property and returns this same instance.
        def with_subsequent_type(value)
          @subsequent_type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'subsequentType'
            @subsequent_type = hash['subsequentType']
          end
        end
      end
    end
  end
end
