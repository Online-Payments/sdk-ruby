#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
      # @attr [String] payment_status_category
      class CreatedPaymentOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment

        attr_accessor :payment_status_category

        # @return (Hash)
        def to_h
          hash = super
          hash['payment'] = @payment.to_h unless @payment.nil?
          hash['paymentStatusCategory'] = @payment_status_category unless @payment_status_category.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'payment'
            raise TypeError, "value '%s' is not a Hash" % [hash['payment']] unless hash['payment'].is_a? Hash
            @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
          end
          if hash.has_key? 'paymentStatusCategory'
            @payment_status_category = hash['paymentStatusCategory']
          end
        end
      end
    end
  end
end
