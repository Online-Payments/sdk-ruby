#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/empty_validator'
require 'onlinepayments/sdk/domain/fixed_list_validator'
require 'onlinepayments/sdk/domain/length_validator'
require 'onlinepayments/sdk/domain/range_validator'
require 'onlinepayments/sdk/domain/regular_expression_validator'

module OnlinePayments::SDK
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
    class PaymentProductFieldValidators < OnlinePayments::SDK::DataObject
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
        hash['emailAddress'] = @email_address.to_h if @email_address
        hash['expirationDate'] = @expiration_date.to_h if @expiration_date
        hash['fixedList'] = @fixed_list.to_h if @fixed_list
        hash['iban'] = @iban.to_h if @iban
        hash['length'] = @length.to_h if @length
        hash['luhn'] = @luhn.to_h if @luhn
        hash['range'] = @range.to_h if @range
        hash['regularExpression'] = @regular_expression.to_h if @regular_expression
        hash['termsAndConditions'] = @terms_and_conditions.to_h if @terms_and_conditions
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'emailAddress'
          raise TypeError, "value '%s' is not a Hash" % [hash['emailAddress']] unless hash['emailAddress'].is_a? Hash
          @email_address = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['emailAddress'])
        end
        if hash.key? 'expirationDate'
          raise TypeError, "value '%s' is not a Hash" % [hash['expirationDate']] unless hash['expirationDate'].is_a? Hash
          @expiration_date = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['expirationDate'])
        end
        if hash.key? 'fixedList'
          raise TypeError, "value '%s' is not a Hash" % [hash['fixedList']] unless hash['fixedList'].is_a? Hash
          @fixed_list = OnlinePayments::SDK::Domain::FixedListValidator.new_from_hash(hash['fixedList'])
        end
        if hash.key? 'iban'
          raise TypeError, "value '%s' is not a Hash" % [hash['iban']] unless hash['iban'].is_a? Hash
          @iban = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['iban'])
        end
        if hash.key? 'length'
          raise TypeError, "value '%s' is not a Hash" % [hash['length']] unless hash['length'].is_a? Hash
          @length = OnlinePayments::SDK::Domain::LengthValidator.new_from_hash(hash['length'])
        end
        if hash.key? 'luhn'
          raise TypeError, "value '%s' is not a Hash" % [hash['luhn']] unless hash['luhn'].is_a? Hash
          @luhn = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['luhn'])
        end
        if hash.key? 'range'
          raise TypeError, "value '%s' is not a Hash" % [hash['range']] unless hash['range'].is_a? Hash
          @range = OnlinePayments::SDK::Domain::RangeValidator.new_from_hash(hash['range'])
        end
        if hash.key? 'regularExpression'
          raise TypeError, "value '%s' is not a Hash" % [hash['regularExpression']] unless hash['regularExpression'].is_a? Hash
          @regular_expression = OnlinePayments::SDK::Domain::RegularExpressionValidator.new_from_hash(hash['regularExpression'])
        end
        if hash.key? 'termsAndConditions'
          raise TypeError, "value '%s' is not a Hash" % [hash['termsAndConditions']] unless hash['termsAndConditions'].is_a? Hash
          @terms_and_conditions = OnlinePayments::SDK::Domain::EmptyValidator.new_from_hash(hash['termsAndConditions'])
        end
      end
    end
  end
end
