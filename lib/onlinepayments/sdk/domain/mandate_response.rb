#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_customer_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] alias
      # @attr [OnlinePayments::SDK::Domain::MandateCustomerResponse, nil] customer
      # @attr [String, nil] customer_reference
      # @attr [String, nil] mandate_pdf
      # @attr [String, nil] recurrence_type
      # @attr [String, nil] status
      # @attr [String, nil] unique_mandate_reference
      class MandateResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :alias

        attr_accessor :customer

        attr_accessor :customer_reference

        attr_accessor :mandate_pdf

        attr_accessor :recurrence_type

        attr_accessor :status

        attr_accessor :unique_mandate_reference

        # @return (Hash)
        def to_h
          hash = super
          hash['alias'] = @alias unless @alias.nil?
          hash['customer'] = @customer.to_h unless @customer.nil?
          hash['customerReference'] = @customer_reference unless @customer_reference.nil?
          hash['mandatePdf'] = @mandate_pdf unless @mandate_pdf.nil?
          hash['recurrenceType'] = @recurrence_type unless @recurrence_type.nil?
          hash['status'] = @status unless @status.nil?
          hash['uniqueMandateReference'] = @unique_mandate_reference unless @unique_mandate_reference.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'alias'
            @alias = hash['alias']
          end
          if hash.has_key? 'customer'
            raise TypeError, "value '%s' is not a Hash" % [hash['customer']] unless hash['customer'].is_a? Hash
            @customer = OnlinePayments::SDK::Domain::MandateCustomerResponse.new_from_hash(hash['customer'])
          end
          if hash.has_key? 'customerReference'
            @customer_reference = hash['customerReference']
          end
          if hash.has_key? 'mandatePdf'
            @mandate_pdf = hash['mandatePdf']
          end
          if hash.has_key? 'recurrenceType'
            @recurrence_type = hash['recurrenceType']
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'uniqueMandateReference'
            @unique_mandate_reference = hash['uniqueMandateReference']
          end
        end
      end
    end
  end
end
