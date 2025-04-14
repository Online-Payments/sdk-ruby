#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [float] exchange_rate
      # @attr [float] inverted_exchange_rate
      # @attr [float] mark_up_rate
      # @attr [String] quotation_date_time
      # @attr [String] source
      class RateDetails < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'exchangeRate'
            @exchange_rate = hash['exchangeRate']
          end
          if hash.has_key? 'invertedExchangeRate'
            @inverted_exchange_rate = hash['invertedExchangeRate']
          end
          if hash.has_key? 'markUpRate'
            @mark_up_rate = hash['markUpRate']
          end
          if hash.has_key? 'quotationDateTime'
            @quotation_date_time = hash['quotationDateTime']
          end
          if hash.has_key? 'source'
            @source = hash['source']
          end
        end
      end
    end
  end
end
