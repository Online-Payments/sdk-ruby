# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/dcc_card_source'
require 'onlinepayments/sdk/domain/transaction'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::DccCardSource, nil] card_source
      # @attr [OnlinePayments::SDK::Domain::Transaction, nil] transaction
      class CurrencyConversionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_source

        attr_accessor :transaction

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(card_source: nil, transaction: nil)
          super()
          @card_source = card_source
          @transaction = transaction
        end

        # Sets the property and returns this same instance.
        def with_card_source(value)
          @card_source = value
          self
        end

        # Sets the property and returns this same instance.
        def with_transaction(value)
          @transaction = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['cardSource'] = @card_source.to_h unless @card_source.nil?
          hash['transaction'] = @transaction.to_h unless @transaction.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'cardSource'
            raise TypeError, "value '#{hash['cardSource']}' is not a Hash" unless hash['cardSource'].is_a? Hash
            @card_source = OnlinePayments::SDK::Domain::DccCardSource.new_from_hash(hash['cardSource'])
          end
          if hash.key? 'transaction'
            raise TypeError, "value '#{hash['transaction']}' is not a Hash" unless hash['transaction'].is_a? Hash
            @transaction = OnlinePayments::SDK::Domain::Transaction.new_from_hash(hash['transaction'])
          end
        end
      end
    end
  end
end
