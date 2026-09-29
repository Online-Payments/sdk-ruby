#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] app_switch_link
      # @attr [String, nil] payment_request_token
      class PaymentProduct350 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :app_switch_link

        attr_accessor :payment_request_token

        # Sets the property and returns this same instance.
        def with_app_switch_link(value)
          @app_switch_link = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_request_token(value)
          @payment_request_token = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['appSwitchLink'] = @app_switch_link unless @app_switch_link.nil?
          hash['paymentRequestToken'] = @payment_request_token unless @payment_request_token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'appSwitchLink'
            @app_switch_link = hash['appSwitchLink']
          end
          if hash.has_key? 'paymentRequestToken'
            @payment_request_token = hash['paymentRequestToken']
          end
        end
      end
    end
  end
end
