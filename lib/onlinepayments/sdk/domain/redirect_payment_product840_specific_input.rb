#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] address_selection_at_pay_pal
    # @attr [String] custom
    class RedirectPaymentProduct840SpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :address_selection_at_pay_pal
      attr_accessor :custom

      # @return (Hash)
      def to_h
        hash = super
        hash['addressSelectionAtPayPal'] = @address_selection_at_pay_pal unless @address_selection_at_pay_pal.nil?
        hash['custom'] = @custom unless @custom.nil?
        hash
      end

      def from_hash(hash)
        super
        @address_selection_at_pay_pal = hash['addressSelectionAtPayPal'] if hash.key? 'addressSelectionAtPayPal'
        @custom = hash['custom'] if hash.key? 'custom'
      end
    end
  end
end
