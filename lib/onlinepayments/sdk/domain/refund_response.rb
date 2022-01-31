#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/order_status_output'
require 'onlinepayments/sdk/domain/refund_output'

module OnlinePayments::SDK
  module Domain

    # @attr [String] id
    # @attr [OnlinePayments::SDK::Domain::RefundOutput] refund_output
    # @attr [String] status
    # @attr [OnlinePayments::SDK::Domain::OrderStatusOutput] status_output
    class RefundResponse < OnlinePayments::SDK::DataObject
      attr_accessor :id
      attr_accessor :refund_output
      attr_accessor :status
      attr_accessor :status_output

      # @return (Hash)
      def to_h
        hash = super
        hash['id'] = @id unless @id.nil?
        hash['refundOutput'] = @refund_output.to_h if @refund_output
        hash['status'] = @status unless @status.nil?
        hash['statusOutput'] = @status_output.to_h if @status_output
        hash
      end

      def from_hash(hash)
        super
        @id = hash['id'] if hash.key? 'id'
        if hash.key? 'refundOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['refundOutput']] unless hash['refundOutput'].is_a? Hash
          @refund_output = OnlinePayments::SDK::Domain::RefundOutput.new_from_hash(hash['refundOutput'])
        end
        @status = hash['status'] if hash.key? 'status'
        if hash.key? 'statusOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
          @status_output = OnlinePayments::SDK::Domain::OrderStatusOutput.new_from_hash(hash['statusOutput'])
        end
      end
    end
  end
end
