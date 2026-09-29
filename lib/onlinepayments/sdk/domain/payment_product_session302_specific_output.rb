#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] session
      class PaymentProductSession302SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :session

        # Sets the property and returns this same instance.
        def with_session(value)
          @session = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['session'] = @session unless @session.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'session'
            @session = hash['session']
          end
        end
      end
    end
  end
end
