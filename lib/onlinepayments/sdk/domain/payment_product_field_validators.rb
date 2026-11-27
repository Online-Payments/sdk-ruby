# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/empty_validator'
require 'onlinepayments/sdk/domain/fixed_list_validator'
require 'onlinepayments/sdk/domain/length_validator'
require 'onlinepayments/sdk/domain/range_validator'
require 'onlinepayments/sdk/domain/regular_expression_validator'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator, nil] email_address
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator, nil] expiration_date
      # @attr [OnlinePayments::SDK::Domain::FixedListValidator, nil] fixed_list
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator, nil] iban
      # @attr [OnlinePayments::SDK::Domain::LengthValidator, nil] length
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator, nil] luhn
      # @attr [OnlinePayments::SDK::Domain::RangeValidator, nil] range
      # @attr [OnlinePayments::SDK::Domain::RegularExpressionValidator, nil] regular_expression
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator, nil] terms_and_conditions
      class PaymentProductFieldValidators < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :email_address

        attr_accessor :expiration_date

        attr_accessor :fixed_list

        attr_accessor :iban

        attr_accessor :length

        attr_accessor :luhn

        attr_accessor :range

        attr_accessor :regular_expression

        attr_accessor :terms_and_conditions

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(email_address: nil,
                       expiration_date: nil,
                       fixed_list: nil,
                       iban: nil,
                       length: nil,
                       luhn: nil,
                       range: nil,
                       regular_expression: nil,
                       terms_and_conditions: nil)
          super()
          @email_address = email_address
          @expiration_date = expiration_date
          @fixed_list = fixed_list
          @iban = iban
          @length = length
          @luhn = luhn
          @range = range
          @regular_expression = regular_expression
          @terms_and_conditions = terms_and_conditions
        end

        # Sets the property and returns this same instance.
        def with_email_address(value)
          @email_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_expiration_date(value)
          @expiration_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fixed_list(value)
          @fixed_list = value
          self
        end

        # Sets the property and returns this same instance.
        def with_iban(value)
          @iban = value
          self
        end

        # Sets the property and returns this same instance.
        def with_length(value)
          @length = value
          self
        end

        # Sets the property and returns this same instance.
        def with_luhn(value)
          @luhn = value
          self
        end

        # Sets the property and returns this same instance.
        def with_range(value)
          @range = value
          self
        end

        # Sets the property and returns this same instance.
        def with_regular_expression(value)
          @regular_expression = value
          self
        end

        # Sets the property and returns this same instance.
        def with_terms_and_conditions(value)
          @terms_and_conditions = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['emailAddress'] = @email_address.to_h unless @email_address.nil?
          hash['expirationDate'] = @expiration_date.to_h unless @expiration_date.nil?
          hash['fixedList'] = @fixed_list.to_h unless @fixed_list.nil?
          hash['iban'] = @iban.to_h unless @iban.nil?
          hash['length'] = @length.to_h unless @length.nil?
          hash['luhn'] = @luhn.to_h unless @luhn.nil?
          hash['range'] = @range.to_h unless @range.nil?
          hash['regularExpression'] = @regular_expression.to_h unless @regular_expression.nil?
          hash['termsAndConditions'] = @terms_and_conditions.to_h unless @terms_and_conditions.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'emailAddress'
            raise TypeError, "value '#{hash['emailAddress']}' is not a Hash" unless hash['emailAddress'].is_a? Hash
            @email_address = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['emailAddress'])
          end
          if hash.key? 'expirationDate'
            raise TypeError, "value '#{hash['expirationDate']}' is not a Hash" unless hash['expirationDate'].is_a? Hash
            @expiration_date = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['expirationDate'])
          end
          if hash.key? 'fixedList'
            raise TypeError, "value '#{hash['fixedList']}' is not a Hash" unless hash['fixedList'].is_a? Hash
            @fixed_list = OnlinePayments::SDK::Domain::FixedListValidator.new_from_hash(hash['fixedList'])
          end
          if hash.key? 'iban'
            raise TypeError, "value '#{hash['iban']}' is not a Hash" unless hash['iban'].is_a? Hash
            @iban = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['iban'])
          end
          if hash.key? 'length'
            raise TypeError, "value '#{hash['length']}' is not a Hash" unless hash['length'].is_a? Hash
            @length = OnlinePayments::SDK::Domain::LengthValidator.new_from_hash(hash['length'])
          end
          if hash.key? 'luhn'
            raise TypeError, "value '#{hash['luhn']}' is not a Hash" unless hash['luhn'].is_a? Hash
            @luhn = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['luhn'])
          end
          if hash.key? 'range'
            raise TypeError, "value '#{hash['range']}' is not a Hash" unless hash['range'].is_a? Hash
            @range = OnlinePayments::SDK::Domain::RangeValidator.new_from_hash(hash['range'])
          end
          if hash.key? 'regularExpression'
            raise TypeError, "value '#{hash['regularExpression']}' is not a Hash" unless hash['regularExpression'].is_a? Hash
            @regular_expression = OnlinePayments::SDK::Domain::RegularExpressionValidator.new_from_hash(hash['regularExpression'])
          end
          if hash.key? 'termsAndConditions'
            raise TypeError, "value '#{hash['termsAndConditions']}' is not a Hash" unless hash['termsAndConditions'].is_a? Hash
            @terms_and_conditions = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['termsAndConditions'])
          end
        end
      end
    end
  end
end
