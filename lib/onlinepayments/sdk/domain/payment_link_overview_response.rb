# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/pagination'
require 'onlinepayments/sdk/domain/payment_link_overview_entry'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Pagination, nil] pagination
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentLinkOverviewEntry>, nil] payment_link_overview_entries
      # @attr [Integer, nil] total
      class PaymentLinkOverviewResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :pagination

        attr_accessor :payment_link_overview_entries

        attr_accessor :total

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(pagination: nil, payment_link_overview_entries: nil, total: nil)
          super()
          @pagination = pagination
          @payment_link_overview_entries = payment_link_overview_entries
          @total = total
        end

        # Sets the property and returns this same instance.
        def with_pagination(value)
          @pagination = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_link_overview_entries(value)
          @payment_link_overview_entries = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total(value)
          @total = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['pagination'] = @pagination.to_h unless @pagination.nil?
          hash['paymentLinkOverviewEntries'] = @payment_link_overview_entries.collect{|val| val.to_h} unless @payment_link_overview_entries.nil?
          hash['total'] = @total unless @total.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'pagination'
            raise TypeError, "value '#{hash['pagination']}' is not a Hash" unless hash['pagination'].is_a? Hash
            @pagination = OnlinePayments::SDK::Domain::Pagination.new_from_hash(hash['pagination'])
          end
          if hash.key? 'paymentLinkOverviewEntries'
            raise TypeError, "value '#{hash['paymentLinkOverviewEntries']}' is not an Array" unless hash['paymentLinkOverviewEntries'].is_a? Array
            @payment_link_overview_entries = []
            hash['paymentLinkOverviewEntries'].each do |e|
              @payment_link_overview_entries << OnlinePayments::SDK::Domain::PaymentLinkOverviewEntry.new_from_hash(e)
            end
          end
          if hash.key? 'total'
            @total = hash['total']
          end
        end
      end
    end
  end
end
