#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/rate_details'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] base_amount
    # @attr [String] disclaimer_display
    # @attr [String] disclaimer_receipt
    # @attr [OnlinePayments::SDK::Domain::RateDetails] rate
    # @attr [OnlinePayments::SDK::Domain::AmountOfMoney] target_amount
    class DccProposal < OnlinePayments::SDK::DataObject
      attr_accessor :base_amount
      attr_accessor :disclaimer_display
      attr_accessor :disclaimer_receipt
      attr_accessor :rate
      attr_accessor :target_amount

      # @return (Hash)
      def to_h
        hash = super
        hash['baseAmount'] = @base_amount.to_h if @base_amount
        hash['disclaimerDisplay'] = @disclaimer_display unless @disclaimer_display.nil?
        hash['disclaimerReceipt'] = @disclaimer_receipt unless @disclaimer_receipt.nil?
        hash['rate'] = @rate.to_h if @rate
        hash['targetAmount'] = @target_amount.to_h if @target_amount
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'baseAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['baseAmount']] unless hash['baseAmount'].is_a? Hash
          @base_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['baseAmount'])
        end
        @disclaimer_display = hash['disclaimerDisplay'] if hash.key? 'disclaimerDisplay'
        @disclaimer_receipt = hash['disclaimerReceipt'] if hash.key? 'disclaimerReceipt'
        if hash.key? 'rate'
          raise TypeError, "value '%s' is not a Hash" % [hash['rate']] unless hash['rate'].is_a? Hash
          @rate = OnlinePayments::SDK::Domain::RateDetails.new_from_hash(hash['rate'])
        end
        if hash.key? 'targetAmount'
          raise TypeError, "value '%s' is not a Hash" % [hash['targetAmount']] unless hash['targetAmount'].is_a? Hash
          @target_amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['targetAmount'])
        end
      end
    end
  end
end
