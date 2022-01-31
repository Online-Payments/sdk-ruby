#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/refund_response'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::RefundResponse>] refunds
    class RefundsResponse < OnlinePayments::SDK::DataObject
      attr_accessor :refunds

      # @return (Hash)
      def to_h
        hash = super
        hash['refunds'] = @refunds.collect(&:to_h) if @refunds
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'refunds'
          raise TypeError, "value '%s' is not an Array" % [hash['refunds']] unless hash['refunds'].is_a? Array
          @refunds = []
          hash['refunds'].each do |e|
            @refunds << OnlinePayments::SDK::Domain::RefundResponse.new_from_hash(e)
          end
        end
      end
    end
  end
end
