# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_group'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductGroup>, nil] payment_product_groups
      class GetPaymentProductGroupsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product_groups

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_product_groups: nil)
          super()
          @payment_product_groups = payment_product_groups
        end

        # Sets the property and returns this same instance.
        def with_payment_product_groups(value)
          @payment_product_groups = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProductGroups'] = @payment_product_groups.collect{|val| val.to_h} unless @payment_product_groups.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentProductGroups'
            raise TypeError, "value '#{hash['paymentProductGroups']}' is not an Array" unless hash['paymentProductGroups'].is_a? Array
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
