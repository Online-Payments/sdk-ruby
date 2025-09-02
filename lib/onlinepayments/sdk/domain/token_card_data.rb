#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_bin_details'
require 'onlinepayments/sdk/domain/card_without_cvv'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CardBinDetails] card_bin_details
      # @attr [OnlinePayments::SDK::Domain::CardWithoutCvv] card_without_cvv
      # @attr [String] cobrand_selection_indicator
      class TokenCardData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :card_bin_details

        attr_accessor :card_without_cvv

        attr_accessor :cobrand_selection_indicator

        # @return (Hash)
        def to_h
          hash = super
          hash['cardBinDetails'] = @card_bin_details.to_h unless @card_bin_details.nil?
          hash['cardWithoutCvv'] = @card_without_cvv.to_h unless @card_without_cvv.nil?
          hash['cobrandSelectionIndicator'] = @cobrand_selection_indicator unless @cobrand_selection_indicator.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'cardBinDetails'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardBinDetails']] unless hash['cardBinDetails'].is_a? Hash
            @card_bin_details = OnlinePayments::SDK::Domain::CardBinDetails.new_from_hash(hash['cardBinDetails'])
          end
          if hash.has_key? 'cardWithoutCvv'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardWithoutCvv']] unless hash['cardWithoutCvv'].is_a? Hash
            @card_without_cvv = OnlinePayments::SDK::Domain::CardWithoutCvv.new_from_hash(hash['cardWithoutCvv'])
          end
          if hash.has_key? 'cobrandSelectionIndicator'
            @cobrand_selection_indicator = hash['cobrandSelectionIndicator']
          end
        end
      end
    end
  end
end
