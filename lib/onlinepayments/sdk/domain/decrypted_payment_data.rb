#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] cardholder_name
      # @attr [String] cryptogram
      # @attr [String] dpan
      # @attr [Integer] eci
      # @attr [String] expiry_date
      class DecryptedPaymentData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :cardholder_name

        attr_accessor :cryptogram

        attr_accessor :dpan

        attr_accessor :eci

        attr_accessor :expiry_date

        # @return (Hash)
        def to_h
          hash = super
          hash['cardholderName'] = @cardholder_name unless @cardholder_name.nil?
          hash['cryptogram'] = @cryptogram unless @cryptogram.nil?
          hash['dpan'] = @dpan unless @dpan.nil?
          hash['eci'] = @eci unless @eci.nil?
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardholderName'
            @cardholder_name = hash['cardholderName']
          end
          if hash.has_key? 'cryptogram'
            @cryptogram = hash['cryptogram']
          end
          if hash.has_key? 'dpan'
            @dpan = hash['dpan']
          end
          if hash.has_key? 'eci'
            @eci = hash['eci']
          end
          if hash.has_key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
        end
      end
    end
  end
end
