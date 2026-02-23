#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/batch_metadata'
require 'onlinepayments/sdk/domain/cancel_payment_batch_request'
require 'onlinepayments/sdk/domain/capture_payment_batch_request'
require 'onlinepayments/sdk/domain/create_payment_link_request'
require 'onlinepayments/sdk/domain/create_payment_request'
require 'onlinepayments/sdk/domain/create_payout_request'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_payment_batch_request'
require 'onlinepayments/sdk/domain/subsequent_payment_batch_request'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::CancelPaymentBatchRequest>] cancel_payments
      # @attr [Array<OnlinePayments::SDK::Domain::CapturePaymentBatchRequest>] capture_payments
      # @attr [Array<OnlinePayments::SDK::Domain::CreatePaymentLinkRequest>] create_payment_links
      # @attr [Array<OnlinePayments::SDK::Domain::CreatePaymentRequest>] create_payments
      # @attr [Array<OnlinePayments::SDK::Domain::CreatePayoutRequest>] create_payouts
      # @attr [OnlinePayments::SDK::Domain::BatchMetadata] header
      # @attr [Array<OnlinePayments::SDK::Domain::RefundPaymentBatchRequest>] refund_payments
      # @attr [Array<OnlinePayments::SDK::Domain::SubsequentPaymentBatchRequest>] subsequent_payments
      class SubmitBatchRequestBody < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cancel_payments

        attr_accessor :capture_payments

        attr_accessor :create_payment_links

        attr_accessor :create_payments

        attr_accessor :create_payouts

        attr_accessor :header

        attr_accessor :refund_payments

        attr_accessor :subsequent_payments

        # @return (Hash)
        def to_h
          hash = super
          hash['cancelPayments'] = @cancel_payments.collect{|val| val.to_h} unless @cancel_payments.nil?
          hash['capturePayments'] = @capture_payments.collect{|val| val.to_h} unless @capture_payments.nil?
          hash['createPaymentLinks'] = @create_payment_links.collect{|val| val.to_h} unless @create_payment_links.nil?
          hash['createPayments'] = @create_payments.collect{|val| val.to_h} unless @create_payments.nil?
          hash['createPayouts'] = @create_payouts.collect{|val| val.to_h} unless @create_payouts.nil?
          hash['header'] = @header.to_h unless @header.nil?
          hash['refundPayments'] = @refund_payments.collect{|val| val.to_h} unless @refund_payments.nil?
          hash['subsequentPayments'] = @subsequent_payments.collect{|val| val.to_h} unless @subsequent_payments.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cancelPayments'
            raise TypeError, "value '%s' is not an Array" % [hash['cancelPayments']] unless hash['cancelPayments'].is_a? Array
            @cancel_payments = []
            hash['cancelPayments'].each do |e|
              @cancel_payments << OnlinePayments::SDK::Domain::CancelPaymentBatchRequest.new_from_hash(e)
            end
          end
          if hash.has_key? 'capturePayments'
            raise TypeError, "value '%s' is not an Array" % [hash['capturePayments']] unless hash['capturePayments'].is_a? Array
            @capture_payments = []
            hash['capturePayments'].each do |e|
              @capture_payments << OnlinePayments::SDK::Domain::CapturePaymentBatchRequest.new_from_hash(e)
            end
          end
          if hash.has_key? 'createPaymentLinks'
            raise TypeError, "value '%s' is not an Array" % [hash['createPaymentLinks']] unless hash['createPaymentLinks'].is_a? Array
            @create_payment_links = []
            hash['createPaymentLinks'].each do |e|
              @create_payment_links << OnlinePayments::SDK::Domain::CreatePaymentLinkRequest.new_from_hash(e)
            end
          end
          if hash.has_key? 'createPayments'
            raise TypeError, "value '%s' is not an Array" % [hash['createPayments']] unless hash['createPayments'].is_a? Array
            @create_payments = []
            hash['createPayments'].each do |e|
              @create_payments << OnlinePayments::SDK::Domain::CreatePaymentRequest.new_from_hash(e)
            end
          end
          if hash.has_key? 'createPayouts'
            raise TypeError, "value '%s' is not an Array" % [hash['createPayouts']] unless hash['createPayouts'].is_a? Array
            @create_payouts = []
            hash['createPayouts'].each do |e|
              @create_payouts << OnlinePayments::SDK::Domain::CreatePayoutRequest.new_from_hash(e)
            end
          end
          if hash.has_key? 'header'
            raise TypeError, "value '%s' is not a Hash" % [hash['header']] unless hash['header'].is_a? Hash
            @header = OnlinePayments::SDK::Domain::BatchMetadata.new_from_hash(hash['header'])
          end
          if hash.has_key? 'refundPayments'
            raise TypeError, "value '%s' is not an Array" % [hash['refundPayments']] unless hash['refundPayments'].is_a? Array
            @refund_payments = []
            hash['refundPayments'].each do |e|
              @refund_payments << OnlinePayments::SDK::Domain::RefundPaymentBatchRequest.new_from_hash(e)
            end
          end
          if hash.has_key? 'subsequentPayments'
            raise TypeError, "value '%s' is not an Array" % [hash['subsequentPayments']] unless hash['subsequentPayments'].is_a? Array
            @subsequent_payments = []
            hash['subsequentPayments'].each do |e|
              @subsequent_payments << OnlinePayments::SDK::Domain::SubsequentPaymentBatchRequest.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
