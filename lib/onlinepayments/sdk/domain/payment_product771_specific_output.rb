#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] mandate_reference
      class PaymentProduct771SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mandate_reference

        # @return (Hash)
        def to_h
          hash = super
          hash['mandateReference'] = @mandate_reference unless @mandate_reference.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'mandateReference'
            @mandate_reference = hash['mandateReference']
          end
        end
      end
    end
  end
end
