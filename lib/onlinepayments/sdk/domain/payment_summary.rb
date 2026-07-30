#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_output_summary'
require 'onlinepayments/sdk/domain/payment_status_output_summary'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] id
      # @attr [OnlinePayments::SDK::Domain::PaymentOutputSummary] payment_output
      # @attr [String] status
      # @attr [OnlinePayments::SDK::Domain::PaymentStatusOutputSummary] status_output
      class PaymentSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :payment_output

        attr_accessor :status

        attr_accessor :status_output

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
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'paymentOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentOutput']] unless hash['paymentOutput'].is_a? Hash
            @payment_output = OnlinePayments::SDK::Domain::PaymentOutputSummary.new_from_hash(hash['paymentOutput'])
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'statusOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PaymentStatusOutputSummary.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
