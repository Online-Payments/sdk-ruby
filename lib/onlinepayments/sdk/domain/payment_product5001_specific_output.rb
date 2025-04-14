#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] account_number
      # @attr [String] authorisation_code
      # @attr [String] liability
      # @attr [String] mobile_phone_number
      # @attr [String] operation_code
      class PaymentProduct5001SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :account_number

        attr_accessor :authorisation_code

        attr_accessor :liability

        attr_accessor :mobile_phone_number

        attr_accessor :operation_code

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
          if hash.has_key? 'accountNumber'
            @account_number = hash['accountNumber']
          end
          if hash.has_key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.has_key? 'liability'
            @liability = hash['liability']
          end
          if hash.has_key? 'mobilePhoneNumber'
            @mobile_phone_number = hash['mobilePhoneNumber']
          end
          if hash.has_key? 'operationCode'
            @operation_code = hash['operationCode']
          end
        end
      end
    end
  end
end
