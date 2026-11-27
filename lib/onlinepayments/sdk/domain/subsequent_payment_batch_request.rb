# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/subsequent_payment_request'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] payment_id
      # @attr [OnlinePayments::SDK::Domain::SubsequentPaymentRequest, nil] subsequent
      class SubsequentPaymentBatchRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_id

        attr_accessor :subsequent

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_id: nil, subsequent: nil)
          super()
          @payment_id = payment_id
          @subsequent = subsequent
        end

        # Sets the property and returns this same instance.
        def with_payment_id(value)
          @payment_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_subsequent(value)
          @subsequent = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash['subsequent'] = @subsequent.to_h unless @subsequent.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'paymentId'
            @payment_id = hash['paymentId']
          end
          if hash.key? 'subsequent'
            raise TypeError, "value '#{hash['subsequent']}' is not a Hash" unless hash['subsequent'].is_a? Hash
            @subsequent = OnlinePayments::SDK::Domain::SubsequentPaymentRequest.new_from_hash(hash['subsequent'])
          end
        end
      end
    end
  end
end
