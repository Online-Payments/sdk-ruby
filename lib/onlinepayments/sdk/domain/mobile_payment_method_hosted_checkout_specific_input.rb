#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/mobile_payment_product320_specific_input'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorization_mode
    # @attr [OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput] payment_product320_specific_input
    # @attr [Integer] payment_product_id
    class MobilePaymentMethodHostedCheckoutSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :authorization_mode
      attr_accessor :payment_product320_specific_input
      attr_accessor :payment_product_id

      # @return (Hash)
      def to_h
        hash = super
        hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
        hash['paymentProduct320SpecificInput'] = @payment_product320_specific_input.to_h if @payment_product320_specific_input
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorization_mode = hash['authorizationMode'] if hash.key? 'authorizationMode'
        if hash.key? 'paymentProduct320SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct320SpecificInput']] unless hash['paymentProduct320SpecificInput'].is_a? Hash
          @payment_product320_specific_input = OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput.new_from_hash(hash['paymentProduct320SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
