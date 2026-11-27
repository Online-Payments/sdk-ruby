# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_customer'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] alias
      # @attr [OnlinePayments::SDK::Domain::MandateCustomer, nil] customer
      # @attr [String, nil] customer_reference
      # @attr [String, nil] language
      # @attr [String, nil] recurrence_type
      # @attr [String, nil] return_url
      # @attr [String, nil] signature_type
      # @attr [String, nil] unique_mandate_reference
      class CreateMandateRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :alias

        attr_accessor :customer

        attr_accessor :customer_reference

        attr_accessor :language

        attr_accessor :recurrence_type

        attr_accessor :return_url

        attr_accessor :signature_type

        attr_accessor :unique_mandate_reference

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(alias: nil,
                       customer: nil,
                       customer_reference: nil,
                       language: nil,
                       recurrence_type: nil,
                       return_url: nil,
                       signature_type: nil,
                       unique_mandate_reference: nil)
          super()
          @alias = binding.local_variable_get(:alias)
          @customer = customer
          @customer_reference = customer_reference
          @language = language
          @recurrence_type = recurrence_type
          @return_url = return_url
          @signature_type = signature_type
          @unique_mandate_reference = unique_mandate_reference
        end

        # Sets the property and returns this same instance.
        def with_alias(value)
          @alias = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer(value)
          @customer = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_reference(value)
          @customer_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_language(value)
          @language = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recurrence_type(value)
          @recurrence_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_return_url(value)
          @return_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_signature_type(value)
          @signature_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_unique_mandate_reference(value)
          @unique_mandate_reference = value
          self
        end

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
          if hash.key? 'alias'
            @alias = hash['alias']
          end
          if hash.key? 'customer'
            raise TypeError, "value '#{hash['customer']}' is not a Hash" unless hash['customer'].is_a? Hash
            @customer = OnlinePayments::SDK::Domain::MandateCustomer.new_from_hash(hash['customer'])
          end
          if hash.key? 'customerReference'
            @customer_reference = hash['customerReference']
          end
          if hash.key? 'language'
            @language = hash['language']
          end
          if hash.key? 'recurrenceType'
            @recurrence_type = hash['recurrenceType']
          end
          if hash.key? 'returnUrl'
            @return_url = hash['returnUrl']
          end
          if hash.key? 'signatureType'
            @signature_type = hash['signatureType']
          end
          if hash.key? 'uniqueMandateReference'
            @unique_mandate_reference = hash['uniqueMandateReference']
          end
        end
      end
    end
  end
end
