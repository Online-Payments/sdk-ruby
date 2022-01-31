#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/decrypted_payment_data'
require 'onlinepayments/sdk/domain/mobile_payment_product320_specific_input'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorization_mode
    # @attr [OnlinePayments::SDK::Domain::DecryptedPaymentData] decrypted_payment_data
    # @attr [String] encrypted_payment_data
    # @attr [String] ephemeral_key
    # @attr [OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput] payment_product320_specific_input
    # @attr [Integer] payment_product_id
    # @attr [String] public_key_hash
    # @attr [true/false] requires_approval
    class MobilePaymentMethodSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :authorization_mode
      attr_accessor :decrypted_payment_data
      attr_accessor :encrypted_payment_data
      attr_accessor :ephemeral_key
      attr_accessor :payment_product320_specific_input
      attr_accessor :payment_product_id
      attr_accessor :public_key_hash
      attr_accessor :requires_approval

      # @return (Hash)
      def to_h
        hash = super
        hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
        hash['decryptedPaymentData'] = @decrypted_payment_data.to_h if @decrypted_payment_data
        hash['encryptedPaymentData'] = @encrypted_payment_data unless @encrypted_payment_data.nil?
        hash['ephemeralKey'] = @ephemeral_key unless @ephemeral_key.nil?
        hash['paymentProduct320SpecificInput'] = @payment_product320_specific_input.to_h if @payment_product320_specific_input
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['publicKeyHash'] = @public_key_hash unless @public_key_hash.nil?
        hash['requiresApproval'] = @requires_approval unless @requires_approval.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorization_mode = hash['authorizationMode'] if hash.key? 'authorizationMode'
        if hash.key? 'decryptedPaymentData'
          raise TypeError, "value '%s' is not a Hash" % [hash['decryptedPaymentData']] unless hash['decryptedPaymentData'].is_a? Hash
          @decrypted_payment_data = OnlinePayments::SDK::Domain::DecryptedPaymentData.new_from_hash(hash['decryptedPaymentData'])
        end
        @encrypted_payment_data = hash['encryptedPaymentData'] if hash.key? 'encryptedPaymentData'
        @ephemeral_key = hash['ephemeralKey'] if hash.key? 'ephemeralKey'
        if hash.key? 'paymentProduct320SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct320SpecificInput']] unless hash['paymentProduct320SpecificInput'].is_a? Hash
          @payment_product320_specific_input = OnlinePayments::SDK::Domain::MobilePaymentProduct320SpecificInput.new_from_hash(hash['paymentProduct320SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @public_key_hash = hash['publicKeyHash'] if hash.key? 'publicKeyHash'
        @requires_approval = hash['requiresApproval'] if hash.key? 'requiresApproval'
      end
    end
  end
end
