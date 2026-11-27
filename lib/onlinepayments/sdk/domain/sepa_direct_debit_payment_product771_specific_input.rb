# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/create_mandate_with_return_url'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] existing_unique_mandate_reference
      # @attr [OnlinePayments::SDK::Domain::CreateMandateWithReturnUrl, nil] mandate
      class SepaDirectDebitPaymentProduct771SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :existing_unique_mandate_reference

        attr_accessor :mandate

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(existing_unique_mandate_reference: nil, mandate: nil)
          super()
          @existing_unique_mandate_reference = existing_unique_mandate_reference
          @mandate = mandate
        end

        # Sets the property and returns this same instance.
        def with_existing_unique_mandate_reference(value)
          @existing_unique_mandate_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mandate(value)
          @mandate = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['existingUniqueMandateReference'] = @existing_unique_mandate_reference unless @existing_unique_mandate_reference.nil?
          hash['mandate'] = @mandate.to_h unless @mandate.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'existingUniqueMandateReference'
            @existing_unique_mandate_reference = hash['existingUniqueMandateReference']
          end
          if hash.key? 'mandate'
            raise TypeError, "value '#{hash['mandate']}' is not a Hash" unless hash['mandate'].is_a? Hash
            @mandate = OnlinePayments::SDK::Domain::CreateMandateWithReturnUrl.new_from_hash(hash['mandate'])
          end
        end
      end
    end
  end
end
