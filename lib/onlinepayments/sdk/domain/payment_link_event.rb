#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] date_time
      # @attr [String] details
      # @attr [String] type
      class PaymentLinkEvent < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :date_time

        attr_accessor :details

        attr_accessor :type

        # @return (Hash)
        def to_h
          hash = super
          hash['dateTime'] = @date_time unless @date_time.nil?
          hash['details'] = @details unless @details.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'dateTime'
            @date_time = hash['dateTime']
          end
          if hash.has_key? 'details'
            @details = hash['details']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
