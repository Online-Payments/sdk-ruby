# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] email_address
      # @attr [String, nil] phone_number
      class MandateContactDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :email_address

        attr_accessor :phone_number

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(email_address: nil, phone_number: nil)
          super()
          @email_address = email_address
          @phone_number = phone_number
        end

        # Sets the property and returns this same instance.
        def with_email_address(value)
          @email_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_phone_number(value)
          @phone_number = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['emailAddress'] = @email_address unless @email_address.nil?
          hash['phoneNumber'] = @phone_number unless @phone_number.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'emailAddress'
            @email_address = hash['emailAddress']
          end
          if hash.key? 'phoneNumber'
            @phone_number = hash['phoneNumber']
          end
        end
      end
    end
  end
end
