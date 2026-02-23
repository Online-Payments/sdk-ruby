#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] acceptance_system_application_id
      # @attr [DateTime] authorization_date
      class Acceptance < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acceptance_system_application_id

        attr_accessor :authorization_date

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptanceSystemApplicationId'] = @acceptance_system_application_id unless @acceptance_system_application_id.nil?
          hash['authorizationDate'] = @authorization_date.iso8601(3) unless @authorization_date.nil?
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
        end
      end
    end
  end
end
