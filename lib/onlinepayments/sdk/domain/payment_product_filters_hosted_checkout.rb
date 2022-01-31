#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_product_filter'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentProductFilter] exclude
    # @attr [OnlinePayments::SDK::Domain::PaymentProductFilter] restrict_to
    class PaymentProductFiltersHostedCheckout < OnlinePayments::SDK::DataObject
      attr_accessor :exclude
      attr_accessor :restrict_to

      # @return (Hash)
      def to_h
        hash = super
        hash['exclude'] = @exclude.to_h if @exclude
        hash['restrictTo'] = @restrict_to.to_h if @restrict_to
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'exclude'
          raise TypeError, "value '%s' is not a Hash" % [hash['exclude']] unless hash['exclude'].is_a? Hash
          @exclude = OnlinePayments::SDK::Domain::PaymentProductFilter.new_from_hash(hash['exclude'])
        end
        if hash.key? 'restrictTo'
          raise TypeError, "value '%s' is not a Hash" % [hash['restrictTo']] unless hash['restrictTo'].is_a? Hash
          @restrict_to = OnlinePayments::SDK::Domain::PaymentProductFilter.new_from_hash(hash['restrictTo'])
        end
      end
    end
  end
end
