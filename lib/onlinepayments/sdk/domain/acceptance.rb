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
          if hash.has_key? 'acceptanceSystemApplicationId'
            @acceptance_system_application_id = hash['acceptanceSystemApplicationId']
          end
          if hash.has_key? 'authorizationDate'
            @authorization_date = DateTime.parse(hash['authorizationDate'])
          end
          if hash.has_key? 'authorizationMessageReference'
            @authorization_message_reference = hash['authorizationMessageReference']
          end
        end
      end
    end
  end
end
