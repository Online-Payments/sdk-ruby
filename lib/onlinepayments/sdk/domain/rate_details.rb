#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Float] exchange_rate
    # @attr [Float] inverted_exchange_rate
    # @attr [Float] mark_up_rate
    # @attr [String] quotation_date_time
    # @attr [String] source
    class RateDetails < OnlinePayments::SDK::DataObject
      attr_accessor :exchange_rate
      attr_accessor :inverted_exchange_rate
      attr_accessor :mark_up_rate
      attr_accessor :quotation_date_time
      attr_accessor :source

      # @return (Hash)
      def to_h
        hash = super
        hash['exchangeRate'] = @exchange_rate unless @exchange_rate.nil?
        hash['invertedExchangeRate'] = @inverted_exchange_rate unless @inverted_exchange_rate.nil?
        hash['markUpRate'] = @mark_up_rate unless @mark_up_rate.nil?
        hash['quotationDateTime'] = @quotation_date_time unless @quotation_date_time.nil?
        hash['source'] = @source unless @source.nil?
        hash
      end

      def from_hash(hash)
        super
        @exchange_rate = hash['exchangeRate'] if hash.key? 'exchangeRate'
        @inverted_exchange_rate = hash['invertedExchangeRate'] if hash.key? 'invertedExchangeRate'
        @mark_up_rate = hash['markUpRate'] if hash.key? 'markUpRate'
        @quotation_date_time = hash['quotationDateTime'] if hash.key? 'quotationDateTime'
        @source = hash['source'] if hash.key? 'source'
      end
    end
  end
end
