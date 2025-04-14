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
      # @attr [Array<OnlinePayments::SDK::Domain::OperationOutput>] operations
      # @attr [OnlinePayments::SDK::Domain::HostedCheckoutSpecificOutput] hosted_checkout_specific_output
      # @attr [String] id
      # @attr [OnlinePayments::SDK::Domain::PaymentOutput] payment_output
      # @attr [String] status
      # @attr [OnlinePayments::SDK::Domain::PaymentStatusOutput] status_output
      class PaymentDetailsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :operations

        attr_accessor :hosted_checkout_specific_output

        attr_accessor :id

        attr_accessor :payment_output

        attr_accessor :status

        attr_accessor :status_output

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
          if hash.has_key? 'Operations'
            raise TypeError, "value '%s' is not an Array" % [hash['Operations']] unless hash['Operations'].is_a? Array
            @operations = []
            hash['Operations'].each do |e|
              @operations << OnlinePayments::SDK::Domain::OperationOutput.new_from_hash(e)
            end
          end
          if hash.has_key? 'hostedCheckoutSpecificOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['hostedCheckoutSpecificOutput']] unless hash['hostedCheckoutSpecificOutput'].is_a? Hash
            @hosted_checkout_specific_output = OnlinePayments::SDK::Domain::HostedCheckoutSpecificOutput.new_from_hash(hash['hostedCheckoutSpecificOutput'])
          end
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'paymentOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentOutput']] unless hash['paymentOutput'].is_a? Hash
            @payment_output = OnlinePayments::SDK::Domain::PaymentOutput.new_from_hash(hash['paymentOutput'])
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'statusOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PaymentStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
