# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_output_summary'
require 'onlinepayments/sdk/domain/payment_status_output_summary'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] id
      # @attr [OnlinePayments::SDK::Domain::PaymentOutputSummary, nil] payment_output
      # @attr [String, nil] status
      # @attr [OnlinePayments::SDK::Domain::PaymentStatusOutputSummary, nil] status_output
      class PaymentSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :payment_output

        attr_accessor :status

        attr_accessor :status_output

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(id: nil, payment_output: nil, status: nil, status_output: nil)
          super()
          @id = id
          @payment_output = payment_output
          @status = status
          @status_output = status_output
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_output(value)
          @payment_output = value
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
          hash['paymentOutput'] = @payment_output.to_h unless @payment_output.nil?
          hash['status'] = @status unless @status.nil?
          hash['statusOutput'] = @status_output.to_h unless @status_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'paymentOutput'
            raise TypeError, "value '#{hash['paymentOutput']}' is not a Hash" unless hash['paymentOutput'].is_a? Hash
            @payment_output = OnlinePayments::SDK::Domain::PaymentOutputSummary.new_from_hash(hash['paymentOutput'])
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'statusOutput'
            raise TypeError, "value '#{hash['statusOutput']}' is not a Hash" unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PaymentStatusOutputSummary.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
