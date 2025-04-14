#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] entity_id
      # @attr [String] payment_end_date
      # @attr [String] payment_reference
      # @attr [String] payment_start_date
      class PaymentProduct5500SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :entity_id

        attr_accessor :payment_end_date

        attr_accessor :payment_reference

        attr_accessor :payment_start_date

        # @return (Hash)
        def to_h
          hash = super
          hash['entityId'] = @entity_id unless @entity_id.nil?
          hash['paymentEndDate'] = @payment_end_date unless @payment_end_date.nil?
          hash['paymentReference'] = @payment_reference unless @payment_reference.nil?
          hash['paymentStartDate'] = @payment_start_date unless @payment_start_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'entityId'
            @entity_id = hash['entityId']
          end
          if hash.has_key? 'paymentEndDate'
            @payment_end_date = hash['paymentEndDate']
          end
          if hash.has_key? 'paymentReference'
            @payment_reference = hash['paymentReference']
          end
          if hash.has_key? 'paymentStartDate'
            @payment_start_date = hash['paymentStartDate']
          end
        end
      end
    end
  end
end
