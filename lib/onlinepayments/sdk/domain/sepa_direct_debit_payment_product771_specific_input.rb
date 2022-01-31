#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/create_mandate_with_return_url'

module OnlinePayments::SDK
  module Domain

    # @attr [String] existing_unique_mandate_reference
    # @attr [OnlinePayments::SDK::Domain::CreateMandateWithReturnUrl] mandate
    class SepaDirectDebitPaymentProduct771SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :existing_unique_mandate_reference
      attr_accessor :mandate

      # @return (Hash)
      def to_h
        hash = super
        hash['existingUniqueMandateReference'] = @existing_unique_mandate_reference unless @existing_unique_mandate_reference.nil?
        hash['mandate'] = @mandate.to_h if @mandate
        hash
      end

      def from_hash(hash)
        super
        @existing_unique_mandate_reference = hash['existingUniqueMandateReference'] if hash.key? 'existingUniqueMandateReference'
        if hash.key? 'mandate'
          raise TypeError, "value '%s' is not a Hash" % [hash['mandate']] unless hash['mandate'].is_a? Hash
          @mandate = OnlinePayments::SDK::Domain::CreateMandateWithReturnUrl.new_from_hash(hash['mandate'])
        end
      end
    end
  end
end
