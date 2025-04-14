#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/merchant_action'
require 'onlinepayments/sdk/domain/payment_creation_output'
require 'onlinepayments/sdk/domain/payment_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentCreationOutput] creation_output
      # @attr [OnlinePayments::SDK::Domain::MerchantAction] merchant_action
      # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
      class CreatePaymentResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :creation_output

        attr_accessor :merchant_action

        attr_accessor :payment

        # @return (Hash)
        def to_h
          hash = super
          hash['creationOutput'] = @creation_output.to_h unless @creation_output.nil?
          hash['merchantAction'] = @merchant_action.to_h unless @merchant_action.nil?
          hash['payment'] = @payment.to_h unless @payment.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'creationOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['creationOutput']] unless hash['creationOutput'].is_a? Hash
            @creation_output = OnlinePayments::SDK::Domain::PaymentCreationOutput.new_from_hash(hash['creationOutput'])
          end
          if hash.has_key? 'merchantAction'
            raise TypeError, "value '%s' is not a Hash" % [hash['merchantAction']] unless hash['merchantAction'].is_a? Hash
            @merchant_action = OnlinePayments::SDK::Domain::MerchantAction.new_from_hash(hash['merchantAction'])
          end
          if hash.has_key? 'payment'
            raise TypeError, "value '%s' is not a Hash" % [hash['payment']] unless hash['payment'].is_a? Hash
            @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
          end
        end
      end
    end
  end
end
