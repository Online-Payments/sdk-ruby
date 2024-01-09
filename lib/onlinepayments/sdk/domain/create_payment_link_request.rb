#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_link_order_input'

module OnlinePayments::SDK
  module Domain

    # @attr [String] description
    # @attr [String] expiration_date
    # @attr [OnlinePayments::SDK::Domain::PaymentLinkOrderInput] payment_link_order
    # @attr [String] recipient_name
    class CreatePaymentLinkRequest < OnlinePayments::SDK::DataObject
      attr_accessor :description
      attr_accessor :expiration_date
      attr_accessor :payment_link_order
      attr_accessor :recipient_name

      # @return (Hash)
      def to_h
        hash = super
        hash['description'] = @description unless @description.nil?
        hash['expirationDate'] = @expiration_date unless @expiration_date.nil?
        hash['paymentLinkOrder'] = @payment_link_order.to_h if @payment_link_order
        hash['recipientName'] = @recipient_name unless @recipient_name.nil?
        hash
      end

      def from_hash(hash)
        super
        @description = hash['description'] if hash.key? 'description'
        @expiration_date = hash['expirationDate'] if hash.key? 'expirationDate'
        if hash.key? 'paymentLinkOrder'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentLinkOrder']] unless hash['paymentLinkOrder'].is_a? Hash
          @payment_link_order = OnlinePayments::SDK::Domain::PaymentLinkOrderInput.new_from_hash(hash['paymentLinkOrder'])
        end
        @recipient_name = hash['recipientName'] if hash.key? 'recipientName'
      end
    end
  end
end
