# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] account_number
      # @attr [String, nil] authorisation_code
      # @attr [String, nil] liability
      # @attr [String, nil] mobile_phone_number
      # @attr [String, nil] operation_code
      class PaymentProduct5001SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :account_number

        attr_accessor :authorisation_code

        attr_accessor :liability

        attr_accessor :mobile_phone_number

        attr_accessor :operation_code

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(account_number: nil, authorisation_code: nil, liability: nil, mobile_phone_number: nil, operation_code: nil)
          super()
          @account_number = account_number
          @authorisation_code = authorisation_code
          @liability = liability
          @mobile_phone_number = mobile_phone_number
          @operation_code = operation_code
        end

        # Sets the property and returns this same instance.
        def with_account_number(value)
          @account_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_authorisation_code(value)
          @authorisation_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_liability(value)
          @liability = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mobile_phone_number(value)
          @mobile_phone_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_operation_code(value)
          @operation_code = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['accountNumber'] = @account_number unless @account_number.nil?
          hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
          hash['liability'] = @liability unless @liability.nil?
          hash['mobilePhoneNumber'] = @mobile_phone_number unless @mobile_phone_number.nil?
          hash['operationCode'] = @operation_code unless @operation_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'accountNumber'
            @account_number = hash['accountNumber']
          end
          if hash.key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.key? 'liability'
            @liability = hash['liability']
          end
          if hash.key? 'mobilePhoneNumber'
            @mobile_phone_number = hash['mobilePhoneNumber']
          end
          if hash.key? 'operationCode'
            @operation_code = hash['operationCode']
          end
        end
      end
    end
  end
end
