#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] delay_in_minutes
      class AutoCapture < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :delay_in_minutes

        # @return (Hash)
        def to_h
          hash = super
          hash['delayInMinutes'] = @delay_in_minutes unless @delay_in_minutes.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'delayInMinutes'
            @delay_in_minutes = hash['delayInMinutes']
          end
        end
      end
    end
  end
end
