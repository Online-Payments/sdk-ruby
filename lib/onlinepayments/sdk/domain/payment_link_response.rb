#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_link_event'
require 'onlinepayments/sdk/domain/payment_link_order'

module OnlinePayments::SDK
  module Domain

    # @attr [String] expiration_date
    # @attr [String] payment_id
    # @attr [Array<OnlinePayments::SDK::Domain::PaymentLinkEvent>] payment_link_events
    # @attr [String] payment_link_id
    # @attr [OnlinePayments::SDK::Domain::PaymentLinkOrder] payment_link_order
    # @attr [String] recipient_name
    # @attr [String] redirection_url
    # @attr [String] status
    class PaymentLinkResponse < OnlinePayments::SDK::DataObject
      attr_accessor :expiration_date
      attr_accessor :payment_id
      attr_accessor :payment_link_events
      attr_accessor :payment_link_id
      attr_accessor :payment_link_order
      attr_accessor :recipient_name
      attr_accessor :redirection_url
      attr_accessor :status

      # @return (Hash)
      def to_h
        hash = super
        hash['expirationDate'] = @expiration_date unless @expiration_date.nil?
        hash['paymentId'] = @payment_id unless @payment_id.nil?
        hash['paymentLinkEvents'] = @payment_link_events.collect(&:to_h) if @payment_link_events
        hash['paymentLinkId'] = @payment_link_id unless @payment_link_id.nil?
        hash['paymentLinkOrder'] = @payment_link_order.to_h if @payment_link_order
        hash['recipientName'] = @recipient_name unless @recipient_name.nil?
        hash['redirectionUrl'] = @redirection_url unless @redirection_url.nil?
        hash['status'] = @status unless @status.nil?
        hash
      end

      def from_hash(hash)
        super
        @expiration_date = hash['expirationDate'] if hash.key? 'expirationDate'
        @payment_id = hash['paymentId'] if hash.key? 'paymentId'
        if hash.key? 'paymentLinkEvents'
          raise TypeError, "value '%s' is not an Array" % [hash['paymentLinkEvents']] unless hash['paymentLinkEvents'].is_a? Array
          @payment_link_events = []
          hash['paymentLinkEvents'].each do |e|
            @payment_link_events << OnlinePayments::SDK::Domain::PaymentLinkEvent.new_from_hash(e)
          end
        end
        @payment_link_id = hash['paymentLinkId'] if hash.key? 'paymentLinkId'
        if hash.key? 'paymentLinkOrder'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentLinkOrder']] unless hash['paymentLinkOrder'].is_a? Hash
          @payment_link_order = OnlinePayments::SDK::Domain::PaymentLinkOrder.new_from_hash(hash['paymentLinkOrder'])
        end
        @recipient_name = hash['recipientName'] if hash.key? 'recipientName'
        @redirection_url = hash['redirectionUrl'] if hash.key? 'redirectionUrl'
        @status = hash['status'] if hash.key? 'status'
      end
    end
  end
end
