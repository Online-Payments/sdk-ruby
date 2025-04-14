#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/order_status_output'
require 'onlinepayments/sdk/domain/refund_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] id
      # @attr [OnlinePayments::SDK::Domain::RefundOutput] refund_output
      # @attr [String] status
      # @attr [OnlinePayments::SDK::Domain::OrderStatusOutput] status_output
      class RefundResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :refund_output

        attr_accessor :status

        attr_accessor :status_output

        # @return (Hash)
        def to_h
          hash = super
          hash['id'] = @id unless @id.nil?
          hash['refundOutput'] = @refund_output.to_h unless @refund_output.nil?
          hash['status'] = @status unless @status.nil?
          hash['statusOutput'] = @status_output.to_h unless @status_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'refundOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['refundOutput']] unless hash['refundOutput'].is_a? Hash
            @refund_output = OnlinePayments::SDK::Domain::RefundOutput.new_from_hash(hash['refundOutput'])
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'statusOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::OrderStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
