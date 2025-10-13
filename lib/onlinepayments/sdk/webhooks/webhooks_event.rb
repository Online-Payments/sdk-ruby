require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_link_response'
require 'onlinepayments/sdk/domain/payment_response'
require 'onlinepayments/sdk/domain/payout_response'
require 'onlinepayments/sdk/domain/refund_response'
require 'onlinepayments/sdk/domain/token_response'

module OnlinePayments
  module SDK
    module Webhooks
      # @attr [String] api_version
      # @attr [String] created
      # @attr [String] id
      # @attr [String] merchant_id
      # @attr [String] type
      # @attr [OnlinePayments::SDK::V2::Domain::PaymentLinkResponse] paymentlink
      # @attr [OnlinePayments::SDK::V2::Domain::PaymentResponse] payment
      # @attr [OnlinePayments::SDK::V2::Domain::PayoutResponse] payout
      # @attr [OnlinePayments::SDK::V2::Domain::RefundResponse] refund
      # @attr [OnlinePayments::SDK::V2::Domain::TokenResponse] token
      class WebhooksEvent < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :api_version

        attr_accessor :created

        attr_accessor :dispute

        attr_accessor :id

        attr_accessor :merchant_id

        attr_accessor :type

        attr_accessor :paymentlink

        attr_accessor :payment

        attr_accessor :payout

        attr_accessor :refund

        attr_accessor :token

        # @return (Hash)
        def to_h
          hash = super
          hash['apiVersion'] = @api_version unless @api_version.nil?
          hash['created'] = @created unless @created.nil?
          hash['id'] = @id unless @id.nil?
          hash['merchantId'] = @merchant_id unless @merchant_id.nil?
          hash['type'] = @type unless @type.nil?
          hash['paymentlink'] = @paymentlink.to_h unless @paymentlink.nil?
          hash['payment'] = @payment.to_h unless @payment.nil?
          hash['payout'] = @payout.to_h unless @payout.nil?
          hash['refund'] = @refund.to_h unless @refund.nil?
          hash['token'] = @token.to_h unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'apiVersion'
            @api_version = hash['apiVersion']
          end
          if hash.has_key? 'created'
            @created = hash['created']
          end
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'merchantId'
            @merchant_id = hash['merchantId']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
          if hash.has_key? 'paymentlink'
            @paymentlink = OnlinePayments::SDK::Domain::PaymentLinkResponse.new_from_hash(hash['paymentlink'])
          end
          if hash.has_key? 'payment'
            @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment'])
          end
          if hash.has_key? 'payout'
            @payout = OnlinePayments::SDK::Domain::PayoutResponse.new_from_hash(hash['payout'])
          end
          if hash.has_key? 'refund'
            @refund = OnlinePayments::SDK::Domain::RefundResponse.new_from_hash(hash['refund'])
          end
          if hash.has_key? 'token'
            @token = OnlinePayments::SDK::Domain::TokenResponse.new_from_hash(hash['token'])
          end
        end
      end
    end
  end
end
