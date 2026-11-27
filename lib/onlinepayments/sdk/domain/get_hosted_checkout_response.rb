# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/created_payment_output'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CreatedPaymentOutput, nil] created_payment_output
      # @attr [String, nil] status
      class GetHostedCheckoutResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :created_payment_output

        attr_accessor :status

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(created_payment_output: nil, status: nil)
          super()
          @created_payment_output = created_payment_output
          @status = status
        end

        # Sets the property and returns this same instance.
        def with_created_payment_output(value)
          @created_payment_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['createdPaymentOutput'] = @created_payment_output.to_h unless @created_payment_output.nil?
          hash['status'] = @status unless @status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'createdPaymentOutput'
            raise TypeError, "value '#{hash['createdPaymentOutput']}' is not a Hash" unless hash['createdPaymentOutput'].is_a? Hash
            @created_payment_output = OnlinePayments::SDK::Domain::CreatedPaymentOutput.new_from_hash(hash['createdPaymentOutput'])
          end
          if hash.key? 'status'
            @status = hash['status']
          end
        end
      end
    end
  end
end
