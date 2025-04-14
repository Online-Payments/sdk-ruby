#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_group'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductGroup>] payment_product_groups
      class GetPaymentProductGroupsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product_groups

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProductGroups'] = @payment_product_groups.collect{|val| val.to_h} unless @payment_product_groups.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProductGroups'
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
end
