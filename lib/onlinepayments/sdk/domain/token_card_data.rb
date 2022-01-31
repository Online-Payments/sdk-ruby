#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card_without_cvv'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv] card_without_cvv
    class TokenCardData < OnlinePayments::SDK::DataObject
      attr_accessor :card_without_cvv

      # @return (Hash)
      def to_h
        hash = super
        hash['cardWithoutCvv'] = @card_without_cvv.to_h if @card_without_cvv
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'cardWithoutCvv'
          raise TypeError, "value '%s' is not a Hash" % [hash['cardWithoutCvv']] unless hash['cardWithoutCvv'].is_a? Hash
          @card_without_cvv = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['cardWithoutCvv'])
        end
      end
    end
  end
end
