#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filter'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFilter] exclude
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFilter] restrict_to
      class PaymentProductFiltersHostedCheckout < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :exclude

        attr_accessor :restrict_to

        # @return (Hash)
        def to_h
          hash = super
          hash['exclude'] = @exclude.to_h unless @exclude.nil?
          hash['restrictTo'] = @restrict_to.to_h unless @restrict_to.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'exclude'
            raise TypeError, "value '%s' is not a Hash" % [hash['exclude']] unless hash['exclude'].is_a? Hash
            @exclude = OnlinePayments::SDK::Domain::PaymentProductFilter.new_from_hash(hash['exclude'])
          end
          if hash.has_key? 'restrictTo'
            raise TypeError, "value '%s' is not a Hash" % [hash['restrictTo']] unless hash['restrictTo'].is_a? Hash
            @restrict_to = OnlinePayments::SDK::Domain::PaymentProductFilter.new_from_hash(hash['restrictTo'])
          end
        end
      end
    end
  end
end
