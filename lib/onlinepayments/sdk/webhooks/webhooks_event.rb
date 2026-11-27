# frozen_string_literal: true

require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/get_batch_status_response'
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
      # @attr [OnlinePayments::SDK::Domain::GetBatchStatusResponse] direct_batch
      # @attr [OnlinePayments::SDK::Domain::PaymentLinkResponse] payment_link
      # @attr [OnlinePayments::SDK::Domain::PaymentResponse] payment
      # @attr [OnlinePayments::SDK::Domain::PayoutResponse] payout
      # @attr [OnlinePayments::SDK::Domain::RefundResponse] refund
      # @attr [OnlinePayments::SDK::Domain::TokenResponse] token
      class WebhooksEvent < OnlinePayments::SDK::Domain::DataObject
        attr_accessor :api_version, :created, :id, :merchant_id, :type, :direct_batch, :payment_link, :payment, :payout, :refund, :token

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(api_version: nil, created: nil, id: nil, merchant_id: nil, type: nil, direct_batch: nil,
                       payment_link: nil, payment: nil, payout: nil, refund: nil, token: nil)
          super()
          @api_version = api_version
          @created = created
          @id = id
          @merchant_id = merchant_id
          @type = type
          @direct_batch = direct_batch
          @payment_link = payment_link
          @payment = payment
          @payout = payout
          @refund = refund
          @token = token
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['apiVersion'] = @api_version unless @api_version.nil?
          hash['created'] = @created unless @created.nil?
          hash['id'] = @id unless @id.nil?
          hash['merchantId'] = @merchant_id unless @merchant_id.nil?
          hash['type'] = @type unless @type.nil?
          hash['directBatch'] = @direct_batch.to_h unless @direct_batch.nil?
          hash['paymentLink'] = @payment_link.to_h unless @payment_link.nil?
          hash['payment'] = @payment.to_h unless @payment.nil?
          hash['payout'] = @payout.to_h unless @payout.nil?
          hash['refund'] = @refund.to_h unless @refund.nil?
          hash['token'] = @token.to_h unless @token.nil?
          hash
        end

        def from_hash(hash)
          super
          @api_version = hash['apiVersion'] if hash.key? 'apiVersion'
          @created = hash['created'] if hash.key? 'created'
          @id = hash['id'] if hash.key? 'id'
          @merchant_id = hash['merchantId'] if hash.key? 'merchantId'
          @type = hash['type'] if hash.key? 'type'
          @direct_batch = OnlinePayments::SDK::Domain::GetBatchStatusResponse.new_from_hash(hash['directBatch']) if hash.key? 'directBatch'
          @payment_link = OnlinePayments::SDK::Domain::PaymentLinkResponse.new_from_hash(hash['paymentLink']) if hash.key? 'paymentLink'
          @payment = OnlinePayments::SDK::Domain::PaymentResponse.new_from_hash(hash['payment']) if hash.key? 'payment'
          @payout = OnlinePayments::SDK::Domain::PayoutResponse.new_from_hash(hash['payout']) if hash.key? 'payout'
          @refund = OnlinePayments::SDK::Domain::RefundResponse.new_from_hash(hash['refund']) if hash.key? 'refund'
          return unless hash.key? 'token'

          @token = OnlinePayments::SDK::Domain::TokenResponse.new_from_hash(hash['token'])
        end
      end
    end
  end
end
