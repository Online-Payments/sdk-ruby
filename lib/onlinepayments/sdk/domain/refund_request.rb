# frozen_string_literal: true

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
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [String, nil] capture_id
      # @attr [true/false, nil] is_final
      # @attr [Array<OnlinePayments::SDK::Domain::LineItemDetail>, nil] line_item_details
      # @attr [OnlinePayments::SDK::Domain::OmnichannelRefundSpecificInput, nil] omnichannel_refund_specific_input
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences, nil] operation_references
      # @attr [String, nil] reason
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [OnlinePayments::SDK::Domain::RefundRedirectPaymentMethodSpecificInput, nil] refund_redirect_payment_method_specific_input
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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil,
                       capture_id: nil,
                       is_final: nil,
                       line_item_details: nil,
                       omnichannel_refund_specific_input: nil,
                       operation_references: nil,
                       reason: nil,
                       references: nil,
                       refund_redirect_payment_method_specific_input: nil)
          super()
          @amount_of_money = amount_of_money
          @capture_id = capture_id
          @is_final = is_final
          @line_item_details = line_item_details
          @omnichannel_refund_specific_input = omnichannel_refund_specific_input
          @operation_references = operation_references
          @reason = reason
          @references = references
          @refund_redirect_payment_method_specific_input = refund_redirect_payment_method_specific_input
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_capture_id(value)
          @capture_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_final(value)
          @is_final = value
          self
        end

        # Sets the property and returns this same instance.
        def with_line_item_details(value)
          @line_item_details = value
          self
        end

        # Sets the property and returns this same instance.
        def with_omnichannel_refund_specific_input(value)
          @omnichannel_refund_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_operation_references(value)
          @operation_references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_reason(value)
          @reason = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_refund_redirect_payment_method_specific_input(value)
          @refund_redirect_payment_method_specific_input = value
          self
        end

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
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'captureId'
            @capture_id = hash['captureId']
          end
          if hash.key? 'isFinal'
            @is_final = hash['isFinal']
          end
          if hash.key? 'lineItemDetails'
            raise TypeError, "value '#{hash['lineItemDetails']}' is not an Array" unless hash['lineItemDetails'].is_a? Array
            @line_item_details = []
            hash['lineItemDetails'].each do |e|
              @line_item_details << OnlinePayments::SDK::Domain::LineItemDetail.new_from_hash(e)
            end
          end
          if hash.key? 'omnichannelRefundSpecificInput'
            raise TypeError, "value '#{hash['omnichannelRefundSpecificInput']}' is not a Hash" unless hash['omnichannelRefundSpecificInput'].is_a? Hash
            @omnichannel_refund_specific_input = OnlinePayments::SDK::Domain::OmnichannelRefundSpecificInput.new_from_hash(hash['omnichannelRefundSpecificInput'])
          end
          if hash.key? 'operationReferences'
            raise TypeError, "value '#{hash['operationReferences']}' is not a Hash" unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.key? 'reason'
            @reason = hash['reason']
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.key? 'refundRedirectPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['refundRedirectPaymentMethodSpecificInput']}' is not a Hash" unless hash['refundRedirectPaymentMethodSpecificInput'].is_a? Hash
            @refund_redirect_payment_method_specific_input = OnlinePayments::SDK::Domain::RefundRedirectPaymentMethodSpecificInput.new_from_hash(hash['refundRedirectPaymentMethodSpecificInput'])
          end
        end
      end
    end
  end
end
