# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] accepted_by_user
      # @attr [String, nil] dcc_session_id
      class CurrencyConversionInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accepted_by_user

        attr_accessor :dcc_session_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(accepted_by_user: nil, dcc_session_id: nil)
          super()
          @accepted_by_user = accepted_by_user
          @dcc_session_id = dcc_session_id
        end

        # Sets the property and returns this same instance.
        def with_accepted_by_user(value)
          @accepted_by_user = value
          self
        end

        # Sets the property and returns this same instance.
        def with_dcc_session_id(value)
          @dcc_session_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptedByUser'] = @accepted_by_user unless @accepted_by_user.nil?
          hash['dccSessionId'] = @dcc_session_id unless @dcc_session_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acceptedByUser'
            @accepted_by_user = hash['acceptedByUser']
          end
          if hash.key? 'dccSessionId'
            @dcc_session_id = hash['dccSessionId']
          end
        end
      end
    end
  end
end
