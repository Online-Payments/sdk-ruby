module OnlinePayments::SDK
  module Webhooks

    # @attr [String] api_version
    # @attr [String] id
    # @attr [String] created
    # @attr [String] merchant_id
    # @attr [String] type
    # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
    # @attr [OnlinePayments::SDK::Domain::PayoutResponse] refund
    # @attr [OnlinePayments::SDK::Domain::RefundResponse] payout
    # @attr [OnlinePayments::SDK::Domain::TokenResponse] token
    # @attr [OnlinePayments::SDK::Domain::DisputeResponse] dispute
    class WebhooksEvent < OnlinePayments::SDK::DataObject

      attr_accessor :api_version
      attr_accessor :id
      attr_accessor :created
      attr_accessor :merchant_id
      attr_accessor :type

      attr_accessor :payment
      attr_accessor :refund
      attr_accessor :payout
      attr_accessor :token
      attr_accessor :dispute

      # @return [Hash]
      def to_h
        hash = super
        hash['apiVersion'] = @api_version if @api_version
        hash['id'] = @id if @id
        hash['created'] = @created if @created
        hash['merchantId'] = @merchant_id if @merchant_id
        hash['type'] = @type if @type
        hash['payment'] = @payment.to_h if @payment
        hash['refund'] = @refund.to_h if @refund
        hash['payout'] = @payout.to_h if @payout
        hash['token'] = @token.to_h if @token
        hash['dispute'] = @dispute.to_h if @dispute
        hash
      end

      def from_hash(hash)
        super
        @api_version = hash['apiVersion'] if hash.key? 'apiVersion'
        @id = hash['id'] if hash.key? 'id'
        @created = hash['created'] if hash.key? 'created'
        @merchant_id = hash['merchantId'] if hash.key? 'merchantId'
        @type = hash['type'] if hash.key? 'type'
        @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment']) if hash.key? 'payment'
        @refund = OnlinePayments::SDK::Domain::RefundResponse.new_from_hash(hash['refund']) if hash.key? 'refund'
        @payout = OnlinePayments::SDK::Domain::PayoutResponse.new_from_hash(hash['payout']) if hash.key? 'payout'
        @token = OnlinePayments::SDK::Domain::TokenResponse.new_from_hash(hash['token']) if hash.key? 'token'
      end
    end
  end
end
