# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] message
      # @attr [String, nil] polling_url
      # @deprecated Deprecated by pendingAuthentication. Contains the third party data for payment product 5001 (Bizum)
      class PaymentProduct5001 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :message

        attr_accessor :polling_url

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(message: nil, polling_url: nil)
          super()
          @message = message
          @polling_url = polling_url
        end

        # Sets the property and returns this same instance.
        def with_message(value)
          @message = value
          self
        end

        # Sets the property and returns this same instance.
        def with_polling_url(value)
          @polling_url = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['message'] = @message unless @message.nil?
          hash['pollingUrl'] = @polling_url unless @polling_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'message'
            @message = hash['message']
          end
          if hash.key? 'pollingUrl'
            @polling_url = hash['pollingUrl']
          end
        end
      end
    end
  end
end
