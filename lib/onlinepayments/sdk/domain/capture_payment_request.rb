# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/line_item_detail'
require 'onlinepayments/sdk/domain/operation_payment_references'
require 'onlinepayments/sdk/domain/payment_references'
require 'onlinepayments/sdk/domain/shipping_detail'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] amount
      # @attr [true/false, nil] is_final
      # @attr [Array<OnlinePayments::SDK::Domain::LineItemDetail>, nil] line_item_details
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences, nil] operation_references
      # @attr [OnlinePayments::SDK::Domain::PaymentReferences, nil] references
      # @attr [OnlinePayments::SDK::Domain::ShippingDetail, nil] shipping
      class CapturePaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :is_final

        attr_accessor :line_item_details

        attr_accessor :operation_references

        attr_accessor :references

        attr_accessor :shipping

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount: nil, is_final: nil, line_item_details: nil, operation_references: nil, references: nil, shipping: nil)
          super()
          @amount = amount
          @is_final = is_final
          @line_item_details = line_item_details
          @operation_references = operation_references
          @references = references
          @shipping = shipping
        end

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
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
        def with_operation_references(value)
          @operation_references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_references(value)
          @references = value
          self
        end

        # Sets the property and returns this same instance.
        def with_shipping(value)
          @shipping = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount unless @amount.nil?
          hash['isFinal'] = @is_final unless @is_final.nil?
          hash['lineItemDetails'] = @line_item_details.collect{|val| val.to_h} unless @line_item_details.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash['references'] = @references.to_h unless @references.nil?
          hash['shipping'] = @shipping.to_h unless @shipping.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amount'
            @amount = hash['amount']
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
          if hash.key? 'operationReferences'
            raise TypeError, "value '#{hash['operationReferences']}' is not a Hash" unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
          if hash.key? 'references'
            raise TypeError, "value '#{hash['references']}' is not a Hash" unless hash['references'].is_a? Hash
            @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
          end
          if hash.key? 'shipping'
            raise TypeError, "value '#{hash['shipping']}' is not a Hash" unless hash['shipping'].is_a? Hash
            @shipping = OnlinePayments::SDK::Domain::ShippingDetail.new_from_hash(hash['shipping'])
          end
        end
      end
    end
  end
end
