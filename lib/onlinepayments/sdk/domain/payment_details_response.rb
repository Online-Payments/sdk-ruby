# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/hosted_checkout_specific_output'
require 'onlinepayments/sdk/domain/operation_output'
require 'onlinepayments/sdk/domain/payment_output'
require 'onlinepayments/sdk/domain/payment_status_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::OperationOutput>, nil] operations
      # @attr [OnlinePayments::SDK::Domain::HostedCheckoutSpecificOutput, nil] hosted_checkout_specific_output
      # @attr [String, nil] id
      # @attr [OnlinePayments::SDK::Domain::PaymentOutput, nil] payment_output
      # @attr [String, nil] status
      # @attr [OnlinePayments::SDK::Domain::PaymentStatusOutput, nil] status_output
      class PaymentDetailsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :operations

        attr_accessor :hosted_checkout_specific_output

        attr_accessor :id

        attr_accessor :payment_output

        attr_accessor :status

        attr_accessor :status_output

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(operations: nil, hosted_checkout_specific_output: nil, id: nil, payment_output: nil, status: nil, status_output: nil)
          super()
          @operations = operations
          @hosted_checkout_specific_output = hosted_checkout_specific_output
          @id = id
          @payment_output = payment_output
          @status = status
          @status_output = status_output
        end

        # Sets the property and returns this same instance.
        def with_operations(value)
          @operations = value
          self
        end

        # Sets the property and returns this same instance.
        def with_hosted_checkout_specific_output(value)
          @hosted_checkout_specific_output = value
          self
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
          hash['Operations'] = @operations.collect{|val| val.to_h} unless @operations.nil?
          hash['hostedCheckoutSpecificOutput'] = @hosted_checkout_specific_output.to_h unless @hosted_checkout_specific_output.nil?
          hash['id'] = @id unless @id.nil?
          hash['paymentOutput'] = @payment_output.to_h unless @payment_output.nil?
          hash['status'] = @status unless @status.nil?
          hash['statusOutput'] = @status_output.to_h unless @status_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'Operations'
            raise TypeError, "value '#{hash['Operations']}' is not an Array" unless hash['Operations'].is_a? Array
            @operations = []
            hash['Operations'].each do |e|
              @operations << OnlinePayments::SDK::Domain::OperationOutput.new_from_hash(e)
            end
          end
          if hash.key? 'hostedCheckoutSpecificOutput'
            raise TypeError, "value '#{hash['hostedCheckoutSpecificOutput']}' is not a Hash" unless hash['hostedCheckoutSpecificOutput'].is_a? Hash
            @hosted_checkout_specific_output = OnlinePayments::SDK::Domain::HostedCheckoutSpecificOutput.new_from_hash(hash['hostedCheckoutSpecificOutput'])
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'paymentOutput'
            raise TypeError, "value '#{hash['paymentOutput']}' is not a Hash" unless hash['paymentOutput'].is_a? Hash
            @payment_output = OnlinePayments::SDK::Domain::PaymentOutput.new_from_hash(hash['paymentOutput'])
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'statusOutput'
            raise TypeError, "value '#{hash['statusOutput']}' is not a Hash" unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PaymentStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
