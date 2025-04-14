#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
      class SubsequentPaymentResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment

        # @return (Hash)
        def to_h
          hash = super
          hash['payment'] = @payment.to_h unless @payment.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'payment'
            raise TypeError, "value '%s' is not a Hash" % [hash['payment']] unless hash['payment'].is_a? Hash
            @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
          end
        end
      end
    end
  end
end
