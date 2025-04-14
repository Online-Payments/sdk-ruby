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
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator] email_address
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator] expiration_date
      # @attr [OnlinePayments::SDK::Domain::FixedListValidator] fixed_list
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator] iban
      # @attr [OnlinePayments::SDK::Domain::LengthValidator] length
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator] luhn
      # @attr [OnlinePayments::SDK::Domain::RangeValidator] range
      # @attr [OnlinePayments::SDK::Domain::RegularExpressionValidator] regular_expression
      # @attr [OnlinePayments::SDK::Domain::EmptyValidator] terms_and_conditions
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
          if hash.has_key? 'emailAddress'
            raise TypeError, "value '%s' is not a Hash" % [hash['emailAddress']] unless hash['emailAddress'].is_a? Hash
            @email_address = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['emailAddress'])
          end
          if hash.has_key? 'expirationDate'
            raise TypeError, "value '%s' is not a Hash" % [hash['expirationDate']] unless hash['expirationDate'].is_a? Hash
            @expiration_date = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['expirationDate'])
          end
          if hash.has_key? 'fixedList'
            raise TypeError, "value '%s' is not a Hash" % [hash['fixedList']] unless hash['fixedList'].is_a? Hash
            @fixed_list = OnlinePayments::SDK::Domain::FixedListValidator.new_from_hash(hash['fixedList'])
          end
          if hash.has_key? 'iban'
            raise TypeError, "value '%s' is not a Hash" % [hash['iban']] unless hash['iban'].is_a? Hash
            @iban = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['iban'])
          end
          if hash.has_key? 'length'
            raise TypeError, "value '%s' is not a Hash" % [hash['length']] unless hash['length'].is_a? Hash
            @length = OnlinePayments::SDK::Domain::LengthValidator.new_from_hash(hash['length'])
          end
          if hash.has_key? 'luhn'
            raise TypeError, "value '%s' is not a Hash" % [hash['luhn']] unless hash['luhn'].is_a? Hash
            @luhn = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['luhn'])
          end
          if hash.has_key? 'range'
            raise TypeError, "value '%s' is not a Hash" % [hash['range']] unless hash['range'].is_a? Hash
            @range = OnlinePayments::SDK::Domain::RangeValidator.new_from_hash(hash['range'])
          end
          if hash.has_key? 'regularExpression'
            raise TypeError, "value '%s' is not a Hash" % [hash['regularExpression']] unless hash['regularExpression'].is_a? Hash
            @regular_expression = OnlinePayments::SDK::Domain::RegularExpressionValidator.new_from_hash(hash['regularExpression'])
          end
          if hash.has_key? 'termsAndConditions'
            raise TypeError, "value '%s' is not a Hash" % [hash['termsAndConditions']] unless hash['termsAndConditions'].is_a? Hash
            @terms_and_conditions = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['termsAndConditions'])
          end
        end
      end
    end
  end
end
