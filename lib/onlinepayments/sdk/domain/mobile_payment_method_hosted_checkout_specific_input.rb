#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mobile_payment_product302_specific_input'
require 'onlinepayments/sdk/domain/mobile_payment_product320_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] authorization_mode
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentProduct302SpecificInput] payment_product302_specific_input
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput] payment_product320_specific_input
      # @attr [Integer] payment_product_id
      class MobilePaymentMethodHostedCheckoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorization_mode

        attr_accessor :payment_product302_specific_input

        attr_accessor :payment_product320_specific_input

        attr_accessor :payment_product_id

        # @return (Hash)
        def to_h
          hash = super
          hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
          hash['paymentProduct302SpecificInput'] = @payment_product302_specific_input.to_h unless @payment_product302_specific_input.nil?
          hash['paymentProduct320SpecificInput'] = @payment_product320_specific_input.to_h unless @payment_product320_specific_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'authorizationMode'
            @authorization_mode = hash['authorizationMode']
          end
          if hash.has_key? 'paymentProduct302SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct302SpecificInput']] unless hash['paymentProduct302SpecificInput'].is_a? Hash
            @payment_product302_specific_input = OnlinePayments::SDK::Domain::MobilePaymentProduct302SpecificInput.new_from_hash(hash['paymentProduct302SpecificInput'])
          end
          if hash.has_key? 'paymentProduct320SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct320SpecificInput']] unless hash['paymentProduct320SpecificInput'].is_a? Hash
            @payment_product320_specific_input = OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput.new_from_hash(hash['paymentProduct320SpecificInput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
