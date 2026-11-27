# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/order_status_output'
require 'onlinepayments/sdk/domain/refund_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] id
      # @attr [OnlinePayments::SDK::Domain::RefundOutput, nil] refund_output
      # @attr [String, nil] status
      # @attr [OnlinePayments::SDK::Domain::OrderStatusOutput, nil] status_output
      class RefundResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :refund_output

        attr_accessor :status

        attr_accessor :status_output

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(id: nil, refund_output: nil, status: nil, status_output: nil)
          super()
          @id = id
          @refund_output = refund_output
          @status = status
          @status_output = status_output
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_refund_output(value)
          @refund_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_output(value)
          @status_output = value
          self
        end

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
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'refundOutput'
            raise TypeError, "value '#{hash['refundOutput']}' is not a Hash" unless hash['refundOutput'].is_a? Hash
            @refund_output = OnlinePayments::SDK::Domain::RefundOutput.new_from_hash(hash['refundOutput'])
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'statusOutput'
            raise TypeError, "value '#{hash['statusOutput']}' is not a Hash" unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::OrderStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
