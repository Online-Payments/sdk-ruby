#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/cursor_pagination_info'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_summary'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CursorPaginationInfo] pagination
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentSummary>] payments
      class PaymentsReportResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :pagination

        attr_accessor :payments

        # @return (Hash)
        def to_h
          hash = super
          hash['pagination'] = @pagination.to_h unless @pagination.nil?
          hash['payments'] = @payments.collect{|val| val.to_h} unless @payments.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'pagination'
            raise TypeError, "value '%s' is not a Hash" % [hash['pagination']] unless hash['pagination'].is_a? Hash
            @pagination = OnlinePayments::SDK::Domain::CursorPaginationInfo.new_from_hash(hash['pagination'])
          end
          if hash.has_key? 'payments'
            raise TypeError, "value '%s' is not an Array" % [hash['payments']] unless hash['payments'].is_a? Array
            @payments = []
            hash['payments'].each do |e|
              @payments << OnlinePayments::SDK::Domain::PaymentSummary.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
