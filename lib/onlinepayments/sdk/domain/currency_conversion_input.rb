#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] accepted_by_user
      # @attr [String] dcc_session_id
      class CurrencyConversionInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accepted_by_user

        attr_accessor :dcc_session_id

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptedByUser'] = @accepted_by_user unless @accepted_by_user.nil?
          hash['dccSessionId'] = @dcc_session_id unless @dcc_session_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acceptedByUser'
            @accepted_by_user = hash['acceptedByUser']
          end
          if hash.has_key? 'dccSessionId'
            @dcc_session_id = hash['dccSessionId']
          end
        end
      end
    end
  end
end
