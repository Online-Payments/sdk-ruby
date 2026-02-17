#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/line_item_detail'
require 'onlinepayments/sdk/domain/operation_payment_references'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [true/false] is_final
      # @attr [Array<OnlinePayments::SDK::Domain::LineItemDetail>] line_item_details
      # @attr [OnlinePayments::SDK::Domain::OperationPaymentReferences] operation_references
      class CancelPaymentRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :is_final

        attr_accessor :line_item_details

        attr_accessor :operation_references

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['isFinal'] = @is_final unless @is_final.nil?
          hash['lineItemDetails'] = @line_item_details.collect{|val| val.to_h} unless @line_item_details.nil?
          hash['operationReferences'] = @operation_references.to_h unless @operation_references.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
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
          if hash.has_key? 'operationReferences'
            raise TypeError, "value '%s' is not a Hash" % [hash['operationReferences']] unless hash['operationReferences'].is_a? Hash
            @operation_references = OnlinePayments::SDK::Domain::OperationPaymentReferences.new_from_hash(hash['operationReferences'])
          end
        end
      end
    end
  end
end
