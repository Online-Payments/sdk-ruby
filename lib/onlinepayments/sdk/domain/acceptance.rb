# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] acceptance_system_application_id
      # @attr [DateTime, nil] authorization_date
      # @attr [String, nil] authorization_message_reference
      class Acceptance < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acceptance_system_application_id

        attr_accessor :authorization_date

        attr_accessor :authorization_message_reference

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acceptance_system_application_id: nil, authorization_date: nil, authorization_message_reference: nil)
          super()
          @acceptance_system_application_id = acceptance_system_application_id
          @authorization_date = authorization_date
          @authorization_message_reference = authorization_message_reference
        end

        # Sets the property and returns this same instance.
        def with_acceptance_system_application_id(value)
          @acceptance_system_application_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_authorization_date(value)
          @authorization_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_authorization_message_reference(value)
          @authorization_message_reference = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptanceSystemApplicationId'] = @acceptance_system_application_id unless @acceptance_system_application_id.nil?
          hash['authorizationDate'] = @authorization_date.iso8601(3) unless @authorization_date.nil?
          hash['authorizationMessageReference'] = @authorization_message_reference unless @authorization_message_reference.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acceptanceSystemApplicationId'
            @acceptance_system_application_id = hash['acceptanceSystemApplicationId']
          end
          if hash.key? 'authorizationDate'
            @authorization_date = DateTime.parse(hash['authorizationDate'])
          end
          if hash.key? 'authorizationMessageReference'
            @authorization_message_reference = hash['authorizationMessageReference']
          end
        end
      end
    end
  end
end
