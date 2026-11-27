# frozen_string_literal: true

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
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount_of_money
      # @attr [OnlinePayments::SDK::Domain::LineItemInvoiceData, nil] invoice_data
      # @attr [OnlinePayments::SDK::Domain::OrderLineDetails, nil] order_line_details
      # @attr [OnlinePayments::SDK::Domain::OtherDetails, nil] other_details
      class LineItem < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount_of_money

        attr_accessor :invoice_data

        attr_accessor :order_line_details

        attr_accessor :other_details

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amount_of_money: nil, invoice_data: nil, order_line_details: nil, other_details: nil)
          super()
          @amount_of_money = amount_of_money
          @invoice_data = invoice_data
          @order_line_details = order_line_details
          @other_details = other_details
        end

        # Sets the property and returns this same instance.
        def with_amount_of_money(value)
          @amount_of_money = value
          self
        end

        # Sets the property and returns this same instance.
        def with_invoice_data(value)
          @invoice_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_order_line_details(value)
          @order_line_details = value
          self
        end

        # Sets the property and returns this same instance.
        def with_other_details(value)
          @other_details = value
          self
        end

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
          if hash.key? 'amountOfMoney'
            raise TypeError, "value '#{hash['amountOfMoney']}' is not a Hash" unless hash['amountOfMoney'].is_a? Hash
            @amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amountOfMoney'])
          end
          if hash.key? 'invoiceData'
            raise TypeError, "value '#{hash['invoiceData']}' is not a Hash" unless hash['invoiceData'].is_a? Hash
            @invoice_data = OnlinePayments::SDK::Domain::LineItemInvoiceData.new_from_hash(hash['invoiceData'])
          end
          if hash.key? 'orderLineDetails'
            raise TypeError, "value '#{hash['orderLineDetails']}' is not a Hash" unless hash['orderLineDetails'].is_a? Hash
            @order_line_details = OnlinePayments::SDK::Domain::OrderLineDetails.new_from_hash(hash['orderLineDetails'])
          end
          if hash.key? 'otherDetails'
            raise TypeError, "value '#{hash['otherDetails']}' is not a Hash" unless hash['otherDetails'].is_a? Hash
            @other_details = OnlinePayments::SDK::Domain::OtherDetails.new_from_hash(hash['otherDetails'])
          end
        end
      end
    end
  end
end
