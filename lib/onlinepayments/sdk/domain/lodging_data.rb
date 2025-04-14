#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] check_in_date
      class LodgingData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :check_in_date

        # @return (Hash)
        def to_h
          hash = super
          hash['checkInDate'] = @check_in_date unless @check_in_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'checkInDate'
            @check_in_date = hash['checkInDate']
          end
        end
      end
    end
  end
end
