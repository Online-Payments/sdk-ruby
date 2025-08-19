#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] message
      # @attr [String] polling_url
      class PaymentProduct5001 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :message

        attr_accessor :polling_url

        # @return (Hash)
        def to_h
          hash = super
          hash['message'] = @message unless @message.nil?
          hash['pollingUrl'] = @polling_url unless @polling_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'message'
            @message = hash['message']
          end
          if hash.has_key? 'pollingUrl'
            @polling_url = hash['pollingUrl']
          end
        end
      end
    end
  end
end
