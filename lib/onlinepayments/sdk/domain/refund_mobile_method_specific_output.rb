#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] network
      # @attr [Integer] total_amount_paid
      # @attr [Integer] total_amount_refunded
      class RefundMobileMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :network

        attr_accessor :total_amount_paid

        attr_accessor :total_amount_refunded

        # @return (Hash)
        def to_h
          hash = super
          hash['network'] = @network unless @network.nil?
          hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
          hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'network'
            @network = hash['network']
          end
          if hash.has_key? 'totalAmountPaid'
            @total_amount_paid = hash['totalAmountPaid']
          end
          if hash.has_key? 'totalAmountRefunded'
            @total_amount_refunded = hash['totalAmountRefunded']
          end
        end
      end
    end
  end
end
