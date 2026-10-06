#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/pagination'
require 'onlinepayments/sdk/domain/payment_link_overview_filtering'
require 'onlinepayments/sdk/domain/payment_link_overview_sorting'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentLinkOverviewFiltering, nil] filtering
      # @attr [OnlinePayments::SDK::Domain::Pagination, nil] pagination
      # @attr [OnlinePayments::SDK::Domain::PaymentLinkOverviewSorting, nil] sorting
      class GetPaymentLinksByMerchantGroupRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :filtering

        attr_accessor :pagination

        attr_accessor :sorting

        # Sets the property and returns this same instance.
        def with_filtering(value)
          @filtering = value
          self
        end

        # Sets the property and returns this same instance.
        def with_pagination(value)
          @pagination = value
          self
        end

        # Sets the property and returns this same instance.
        def with_sorting(value)
          @sorting = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['filtering'] = @filtering.to_h unless @filtering.nil?
          hash['pagination'] = @pagination.to_h unless @pagination.nil?
          hash['sorting'] = @sorting.to_h unless @sorting.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'filtering'
            raise TypeError, "value '%s' is not a Hash" % [hash['filtering']] unless hash['filtering'].is_a? Hash
            @filtering = OnlinePayments::SDK::Domain::PaymentLinkOverviewFiltering.new_from_hash(hash['filtering'])
          end
          if hash.has_key? 'pagination'
            raise TypeError, "value '%s' is not a Hash" % [hash['pagination']] unless hash['pagination'].is_a? Hash
            @pagination = OnlinePayments::SDK::Domain::Pagination.new_from_hash(hash['pagination'])
          end
          if hash.has_key? 'sorting'
            raise TypeError, "value '%s' is not a Hash" % [hash['sorting']] unless hash['sorting'].is_a? Hash
            @sorting = OnlinePayments::SDK::Domain::PaymentLinkOverviewSorting.new_from_hash(hash['sorting'])
          end
        end
      end
    end
  end
end
