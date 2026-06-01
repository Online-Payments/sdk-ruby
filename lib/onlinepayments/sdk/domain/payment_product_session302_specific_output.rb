#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] session
      class PaymentProductSession302SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :session

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
