#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_product_group'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductGroup>] payment_product_groups
    class GetPaymentProductGroupsResponse < OnlinePayments::SDK::DataObject
      attr_accessor :payment_product_groups

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentProductGroups'] = @payment_product_groups.collect(&:to_h) if @payment_product_groups
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'paymentProductGroups'
          raise TypeError, "value '%s' is not an Array" % [hash['paymentProductGroups']] unless hash['paymentProductGroups'].is_a? Array
          @payment_product_groups = []
          hash['paymentProductGroups'].each do |e|
            @payment_product_groups << OnlinePayments::SDK::Domain::PaymentProductGroup.new_from_hash(e)
          end
        end
      end
    end
  end
end
