#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] account_id
      # @attr [String, nil] company_name
      # @attr [String, nil] country_code
      # @attr [String, nil] customer_account_status
      # @attr [String, nil] customer_address_status
      # @attr [String, nil] first_name
      # @attr [String, nil] payer_id
      # @attr [String, nil] surname
      class PaymentProduct840CustomerAccount < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :account_id

        attr_accessor :company_name

        attr_accessor :country_code

        attr_accessor :customer_account_status

        attr_accessor :customer_address_status

        attr_accessor :first_name

        attr_accessor :payer_id

        attr_accessor :surname

        # Sets the property and returns this same instance.
        def with_account_id(value)
          @account_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_company_name(value)
          @company_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_country_code(value)
          @country_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_account_status(value)
          @customer_account_status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_customer_address_status(value)
          @customer_address_status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_first_name(value)
          @first_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payer_id(value)
          @payer_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surname(value)
          @surname = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['accountId'] = @account_id unless @account_id.nil?
          hash['companyName'] = @company_name unless @company_name.nil?
          hash['countryCode'] = @country_code unless @country_code.nil?
          hash['customerAccountStatus'] = @customer_account_status unless @customer_account_status.nil?
          hash['customerAddressStatus'] = @customer_address_status unless @customer_address_status.nil?
          hash['firstName'] = @first_name unless @first_name.nil?
          hash['payerId'] = @payer_id unless @payer_id.nil?
          hash['surname'] = @surname unless @surname.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'accountId'
            @account_id = hash['accountId']
          end
          if hash.has_key? 'companyName'
            @company_name = hash['companyName']
          end
          if hash.has_key? 'countryCode'
            @country_code = hash['countryCode']
          end
          if hash.has_key? 'customerAccountStatus'
            @customer_account_status = hash['customerAccountStatus']
          end
          if hash.has_key? 'customerAddressStatus'
            @customer_address_status = hash['customerAddressStatus']
          end
          if hash.has_key? 'firstName'
            @first_name = hash['firstName']
          end
          if hash.has_key? 'payerId'
            @payer_id = hash['payerId']
          end
          if hash.has_key? 'surname'
            @surname = hash['surname']
          end
        end
      end
    end
  end
end
