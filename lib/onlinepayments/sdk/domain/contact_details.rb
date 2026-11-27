# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] email_address
      # @attr [String, nil] fax_number
      # @attr [String, nil] mobile_phone_number
      # @attr [String, nil] phone_number
      # @attr [String, nil] work_phone_number
      class ContactDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :email_address

        attr_accessor :fax_number

        attr_accessor :mobile_phone_number

        attr_accessor :phone_number

        attr_accessor :work_phone_number

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(email_address: nil, fax_number: nil, mobile_phone_number: nil, phone_number: nil, work_phone_number: nil)
          super()
          @email_address = email_address
          @fax_number = fax_number
          @mobile_phone_number = mobile_phone_number
          @phone_number = phone_number
          @work_phone_number = work_phone_number
        end

        # Sets the property and returns this same instance.
        def with_email_address(value)
          @email_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fax_number(value)
          @fax_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mobile_phone_number(value)
          @mobile_phone_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_phone_number(value)
          @phone_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_work_phone_number(value)
          @work_phone_number = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['emailAddress'] = @email_address unless @email_address.nil?
          hash['faxNumber'] = @fax_number unless @fax_number.nil?
          hash['mobilePhoneNumber'] = @mobile_phone_number unless @mobile_phone_number.nil?
          hash['phoneNumber'] = @phone_number unless @phone_number.nil?
          hash['workPhoneNumber'] = @work_phone_number unless @work_phone_number.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'emailAddress'
            @email_address = hash['emailAddress']
          end
          if hash.key? 'faxNumber'
            @fax_number = hash['faxNumber']
          end
          if hash.key? 'mobilePhoneNumber'
            @mobile_phone_number = hash['mobilePhoneNumber']
          end
          if hash.key? 'phoneNumber'
            @phone_number = hash['phoneNumber']
          end
          if hash.key? 'workPhoneNumber'
            @work_phone_number = hash['workPhoneNumber']
          end
        end
      end
    end
  end
end
