# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] operator_id
      # @attr [String, nil] payment_id
      class OmnichannelPayoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :operator_id

        attr_accessor :payment_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(operator_id: nil, payment_id: nil)
          super()
          @operator_id = operator_id
          @payment_id = payment_id
        end

        # Sets the property and returns this same instance.
        def with_operator_id(value)
          @operator_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_id(value)
          @payment_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['operatorId'] = @operator_id unless @operator_id.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'operatorId'
            @operator_id = hash['operatorId']
          end
          if hash.key? 'paymentId'
            @payment_id = hash['paymentId']
          end
        end
      end
    end
  end
end
