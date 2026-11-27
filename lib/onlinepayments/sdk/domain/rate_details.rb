# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [float, nil] exchange_rate
      # @attr [float, nil] inverted_exchange_rate
      # @attr [float, nil] mark_up_rate
      # @attr [String, nil] quotation_date_time
      # @attr [String, nil] source
      class RateDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :exchange_rate

        attr_accessor :inverted_exchange_rate

        attr_accessor :mark_up_rate

        attr_accessor :quotation_date_time

        attr_accessor :source

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(exchange_rate: nil, inverted_exchange_rate: nil, mark_up_rate: nil, quotation_date_time: nil, source: nil)
          super()
          @exchange_rate = exchange_rate
          @inverted_exchange_rate = inverted_exchange_rate
          @mark_up_rate = mark_up_rate
          @quotation_date_time = quotation_date_time
          @source = source
        end

        # Sets the property and returns this same instance.
        def with_exchange_rate(value)
          @exchange_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_inverted_exchange_rate(value)
          @inverted_exchange_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mark_up_rate(value)
          @mark_up_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_quotation_date_time(value)
          @quotation_date_time = value
          self
        end

        # Sets the property and returns this same instance.
        def with_source(value)
          @source = value
          self
        end

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
          if hash.key? 'exchangeRate'
            @exchange_rate = hash['exchangeRate']
          end
          if hash.key? 'invertedExchangeRate'
            @inverted_exchange_rate = hash['invertedExchangeRate']
          end
          if hash.key? 'markUpRate'
            @mark_up_rate = hash['markUpRate']
          end
          if hash.key? 'quotationDateTime'
            @quotation_date_time = hash['quotationDateTime']
          end
          if hash.key? 'source'
            @source = hash['source']
          end
        end
      end
    end
  end
end
