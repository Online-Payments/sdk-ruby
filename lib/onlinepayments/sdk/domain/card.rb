#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] card_number
      # @attr [String] cardholder_name
      # @attr [String] cvv
      # @attr [String] expiry_date
      class Card < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_number

        attr_accessor :cardholder_name

        attr_accessor :cvv

        attr_accessor :expiry_date

        # @return (Hash)
        def to_h
          hash = super
          hash['cardNumber'] = @card_number unless @card_number.nil?
          hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
          hash['cvv'] = @cvv unless @cvv.nil?
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardNumber'
            @card_number = hash['cardNumber']
          end
          if hash.has_key? 'cardholderName'
            @cardholder_name = hash['cardholderName']
          end
          if hash.has_key? 'cvv'
            @cvv = hash['cvv']
          end
          if hash.has_key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
        end
      end
    end
  end
end
