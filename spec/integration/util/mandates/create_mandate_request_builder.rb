require 'onlinepayments/sdk/domain/bank_account_iban'
require 'onlinepayments/sdk/domain/create_mandate_request'
require 'onlinepayments/sdk/domain/mandate_address'
require 'onlinepayments/sdk/domain/mandate_contact_details'
require 'onlinepayments/sdk/domain/mandate_customer'
require 'onlinepayments/sdk/domain/mandate_personal_information'
require 'onlinepayments/sdk/domain/mandate_personal_name'

module Integration
  module Util
    module Mandates
      class CreateMandateRequestBuilder
        def initialize
          @alias = 'Test Mandate'
          @customer_iban = 'BE45000253450589'
          @company_name = 'BEL Labs'
          @email_address = 'wile.e.coyote@acmelabs.com'
          @city = 'Brussels'
          @country_code = 'BE'
          @house_number = '3'
          @street = 'Da Vincilaan'
          @zip = '1930'
          @first_name = 'Jane'
          @surname = 'Doe'
          @title = 'Mrs'
          @customer_reference = 'CUST123'
          @recurrence_type = 'UNIQUE'
          @signature_type = 'UNSIGNED'
          @return_url = 'https://example-mandate-signing-url.com'
          @unique_mandate_reference = 'MANDATE123'
        end

        def with_alias(value)
          @alias = value
          self
        end

        def with_customer_iban(value)
          @customer_iban = value
          self
        end

        def with_company_name(value)
          @company_name = value
          self
        end

        def with_email_address(value)
          @email_address = value
          self
        end

        def with_city(value)
          @city = value
          self
        end

        def with_country_code(value)
          @country_code = value
          self
        end

        def with_house_number(value)
          @house_number = value
          self
        end

        def with_street(value)
          @street = value
          self
        end

        def with_zip(value)
          @zip = value
          self
        end

        def with_first_name(value)
          @first_name = value
          self
        end

        def with_surname(value)
          @surname = value
          self
        end

        def with_title(value)
          @title = value
          self
        end

        def with_customer_reference(value)
          @customer_reference = value
          self
        end

        def with_recurrence_type(value)
          @recurrence_type = value
          self
        end

        def with_signature_type(value)
          @signature_type = value
          self
        end

        def with_return_url(value)
          @return_url = value
          self
        end

        def with_unique_mandate_reference(value)
          @unique_mandate_reference = value
          self
        end

        def build
          bank_account = OnlinePayments::SDK::Domain::BankAccountIban.new
          bank_account.iban = @customer_iban

          contact_details = OnlinePayments::SDK::Domain::MandateContactDetails.new
          contact_details.email_address = @email_address

          address = OnlinePayments::SDK::Domain::MandateAddress.new
          address.city = @city
          address.country_code = @country_code
          address.house_number = @house_number
          address.street = @street
          address.zip = @zip

          personal_name = OnlinePayments::SDK::Domain::MandatePersonalName.new
          personal_name.first_name = @first_name
          personal_name.surname = @surname

          personal_information = OnlinePayments::SDK::Domain::MandatePersonalInformation.new
          personal_information.name = personal_name
          personal_information.title = @title

          customer = OnlinePayments::SDK::Domain::MandateCustomer.new
          customer.bank_account_iban = bank_account
          customer.company_name = @company_name
          customer.contact_details = contact_details
          customer.mandate_address = address
          customer.personal_information = personal_information

          request = OnlinePayments::SDK::Domain::CreateMandateRequest.new
          request.alias = @alias
          request.customer = customer
          request.customer_reference = @customer_reference
          request.recurrence_type = @recurrence_type
          request.signature_type = @signature_type
          request.return_url = @return_url
          request.unique_mandate_reference = @unique_mandate_reference
          request
        end
      end
    end
  end
end
