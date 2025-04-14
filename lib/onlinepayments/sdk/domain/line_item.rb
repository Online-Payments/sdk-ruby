#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/line_item_invoice_data'
require 'onlinepayments/sdk/domain/order_line_details'
require 'onlinepayments/sdk/domain/other_details'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::LineItemInvoiceData] invoice_data
      # @attr [OnlinePayments::SDK::Domain::OrderLineDetails] order_line_details
      # @attr [OnlinePayments::SDK::Domain::OtherDetails] other_details
      class LineItem < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :invoice_data

        attr_accessor :order_line_details

        attr_accessor :other_details

        # @return (Hash)
        def to_h
          hash = super
          hash['amountOfMoney'] = @amount_of_money.to_h unless @amount_of_money.nil?
          hash['invoiceData'] = @invoice_data.to_h unless @invoice_data.nil?
          hash['orderLineDetails'] = @order_line_details.to_h unless @order_line_details.nil?
          hash['otherDetails'] = @other_details.to_h unless @other_details.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amountOfMoney'
            raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.has_key? 'invoiceData'
            raise TypeError, "value '%s' is not a Hash" % [hash['invoiceData']] unless hash['invoiceData'].is_a? Hash
            @invoice_data = OnlinePayments::SDK::Domain::LineItemInvoiceData.new_from_hash(hash['invoiceData'])
          end
          if hash.has_key? 'orderLineDetails'
            raise TypeError, "value '%s' is not a Hash" % [hash['orderLineDetails']] unless hash['orderLineDetails'].is_a? Hash
            @order_line_details = OnlinePayments::SDK::Domain::OrderLineDetails.new_from_hash(hash['orderLineDetails'])
          end
          if hash.has_key? 'otherDetails'
            raise TypeError, "value '%s' is not a Hash" % [hash['otherDetails']] unless hash['otherDetails'].is_a? Hash
            @other_details = OnlinePayments::SDK::Domain::OtherDetails.new_from_hash(hash['otherDetails'])
          end
        end
      end
    end
  end
end
