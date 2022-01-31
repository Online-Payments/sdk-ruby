#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/merchant_action'
require 'onlinepayments/sdk/domain/payment_creation_output'
require 'onlinepayments/sdk/domain/payment_response'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentCreationOutput] creation_output
    # @attr [OnlinePayments::SDK::Domain::MerchantAction] merchant_action
    # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
    class CompletePaymentResponse < OnlinePayments::SDK::DataObject
      attr_accessor :creation_output
      attr_accessor :merchant_action
      attr_accessor :payment

      # @return (Hash)
      def to_h
        hash = super
        hash['creationOutput'] = @creation_output.to_h if @creation_output
        hash['merchantAction'] = @merchant_action.to_h if @merchant_action
        hash['payment'] = @payment.to_h if @payment
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'creationOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['creationOutput']] unless hash['creationOutput'].is_a? Hash
          @creation_output = OnlinePayments::SDK::Domain::PaymentCreationOutput.new_from_hash(hash['creationOutput'])
        end
        if hash.key? 'merchantAction'
          raise TypeError, "value '%s' is not a Hash" % [hash['merchantAction']] unless hash['merchantAction'].is_a? Hash
          @merchant_action = OnlinePayments::SDK::Domain::MerchantAction.new_from_hash(hash['merchantAction'])
        end
        if hash.key? 'payment'
          raise TypeError, "value '%s' is not a Hash" % [hash['payment']] unless hash['payment'].is_a? Hash
          @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
        end
      end
    end
  end
end
