#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_customer'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] alias
      # @attr [OnlinePayments::SDK::Domain::MandateCustomer] customer
      # @attr [String] customer_reference
      # @attr [String] language
      # @attr [String] recurrence_type
      # @attr [String] return_url
      # @attr [String] signature_type
      # @attr [String] unique_mandate_reference
      class CreateMandateRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :alias

        attr_accessor :customer

        attr_accessor :customer_reference

        attr_accessor :language

        attr_accessor :recurrence_type

        attr_accessor :return_url

        attr_accessor :signature_type

        attr_accessor :unique_mandate_reference

        # @return (Hash)
        def to_h
          hash = super
          hash['alias'] = @alias unless @alias.nil?
          hash['customer'] = @customer.to_h unless @customer.nil?
          hash['customerReference'] = @customer_reference unless @customer_reference.nil?
          hash['language'] = @language unless @language.nil?
          hash['recurrenceType'] = @recurrence_type unless @recurrence_type.nil?
          hash['returnUrl'] = @return_url unless @return_url.nil?
          hash['signatureType'] = @signature_type unless @signature_type.nil?
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
            @customer = OnlinePayments::SDK::Domain::MandateCustomer.new_from_hash(hash['customer'])
          end
          if hash.has_key? 'customerReference'
            @customer_reference = hash['customerReference']
          end
          if hash.has_key? 'language'
            @language = hash['language']
          end
          if hash.has_key? 'recurrenceType'
            @recurrence_type = hash['recurrenceType']
          end
          if hash.has_key? 'returnUrl'
            @return_url = hash['returnUrl']
          end
          if hash.has_key? 'signatureType'
            @signature_type = hash['signatureType']
          end
          if hash.has_key? 'uniqueMandateReference'
            @unique_mandate_reference = hash['uniqueMandateReference']
          end
        end
      end
    end
  end
end
