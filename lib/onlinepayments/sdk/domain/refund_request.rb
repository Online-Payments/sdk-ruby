#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/line_item_detail'
require 'onlinepayments/sdk/domain/omnichannel_refund_specific_input'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/refund_redirect_payment_method_specific_input'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [String] capture_id
      # @attr [true/false] is_final
      # @attr [Array<OnlinePayments::SDK::Domain::LineItemDetail>] line_item_details
      # @attr [OnlinePayments::SDK::Domain::OmnichannelRefundSpecificInput] omnichannel_refund_specific_input
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      # @attr [String] reason
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
      # @attr [OnlinePayments::SDK::Domain::RefundRedirectPaymentMethodSpecificInput] refund_redirect_payment_method_specific_input
      class RefundRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :capture_id

        attr_accessor :is_final

        attr_accessor :line_item_details

        attr_accessor :omnichannel_refund_specific_input

        attr_accessor :operation_references

        attr_accessor :reason

        attr_accessor :references

        attr_accessor :refund_redirect_payment_method_specific_input

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['captureId'] = @capture_id unless @capture_id.nil?
          hash['isFinal'] = @is_final unless @is_final.nil?
          hash['lineItemDetails'] = @line_item_details.collect{|val| val.to_h} unless @line_item_details.nil?
          hash['omnichannelRefundSpecificInput'] = @omnichannel_refund_specific_input.to_h unless @omnichannel_refund_specific_input.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['reason'] = @reason unless @reason.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['refundRedirectPaymentMethodSpecificInput'] = @refund_redirect_payment_method_specific_input.to_h unless @refund_redirect_payment_method_specific_input.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'captureId'
            @capture_id = hash['captureId']
          end
          if hash.has_key? 'isFinal'
            @is_final = hash['isFinal']
          end
          if hash.has_key? 'lineItemDetails'
            raise TypeError, "value '%s' is not an Array" % [hash['lineItemDetails']] unless hash['lineItemDetails'].is_a? Array
            @line_item_details = []
            hash['lineItemDetails'].each do |e|
              @line_item_details << OnlinePayments::SDK::Domain::LineItemDetail.new_from_hash(e)
            end
          end
          if hash.has_key? 'omnichannelRefundSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['omnichannelRefundSpecificInput']] unless hash['omnichannelRefundSpecificInput'].is_a? Hash
            @omnichannel_refund_specific_input = OnlinePayments::SDK::Domain::OmnichannelRefundSpecificInput.new_from_hash(hash['omnichannelRefundSpecificInput'])
          end
          if hash.has_key? 'operationReferences'
            raise TypeError, "value '%s' is not a Hash" % [hash['operationReferences']] unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.has_key? 'reason'
            @reason = hash['reason']
          end
          if hash.has_key? 'references'
            raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.has_key? 'refundRedirectPaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['refundRedirectPaymentMethodSpecificInput']] unless hash['refundRedirectPaymentMethodSpecificInput'].is_a? Hash
            @refund_redirect_payment_method_specific_input = OnlinePayments::SDK::Domain::RefundRedirectPaymentMethodSpecificInput.new_from_hash(hash['refundRedirectPaymentMethodSpecificInput'])
          end
        end
      end
    end
  end
end
