#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/create_mandate_request'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] existing_unique_mandate_reference
      # @attr [OnlinePayments::SDK::Domain::CreateMandateRequest] mandate
      class SepaDirectDebitPaymentProduct771SpecificInputBase < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :existing_unique_mandate_reference

        attr_accessor :mandate

        # @return (Hash)
        def to_h
          hash = super
          hash['existingUniqueMandateReference'] = @existing_unique_mandate_reference unless @existing_unique_mandate_reference.nil?
          hash['mandate'] = @mandate.to_h unless @mandate.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'existingUniqueMandateReference'
            @existing_unique_mandate_reference = hash['existingUniqueMandateReference']
          end
          if hash.has_key? 'mandate'
            raise TypeError, "value '%s' is not a Hash" % [hash['mandate']] unless hash['mandate'].is_a? Hash
            @mandate = OnlinePayments::SDK::Domain::CreateMandateRequest.new_from_hash(hash['mandate'])
          end
        end
      end
    end
  end
end
