#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/line_item_invoice_data'
require 'onlinepayments/sdk/domain/order_line_details'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] amount_of_money
    # @attr [OnlinePayments::SDK::Domain::LineItemInvoiceData] invoice_data
    # @attr [OnlinePayments::SDK::Domain::OrderLineDetails] order_line_details
    class LineItem < OnlinePayments::SDK::DataObject
      attr_accessor :amount_of_money
      attr_accessor :invoice_data
      attr_accessor :order_line_details

      # @return (Hash)
      def to_h
        hash = super
        hash['amountOfMoney'] = @amount_of_money.to_h if @amount_of_money
        hash['invoiceData'] = @invoice_data.to_h if @invoice_data
        hash['orderLineDetails'] = @order_line_details.to_h if @order_line_details
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'amountOfMoney'
          raise TypeError, "value '%s' is not a Hash" % [hash['amountOfMoney']] unless hash['amountOfMoney'].is_a? Hash
          @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'invoiceData'
          raise TypeError, "value '%s' is not a Hash" % [hash['invoiceData']] unless hash['invoiceData'].is_a? Hash
          @invoice_data = OnlinePayments::SDK::Domain::LineItemInvoiceData.new_from_hash(hash['invoiceData'])
        end
        if hash.key? 'orderLineDetails'
          raise TypeError, "value '%s' is not a Hash" % [hash['orderLineDetails']] unless hash['orderLineDetails'].is_a? Hash
          @order_line_details = OnlinePayments::SDK::Domain::OrderLineDetails.new_from_hash(hash['orderLineDetails'])
        end
      end
    end
  end
end
