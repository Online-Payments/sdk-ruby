# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] avs_result
      # @attr [String, nil] cvv_result
      # @attr [String, nil] fraud_service_result
      class CardFraudResults < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :avs_result

        attr_accessor :cvv_result

        attr_accessor :fraud_service_result

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(avs_result: nil, cvv_result: nil, fraud_service_result: nil)
          super()
          @avs_result = avs_result
          @cvv_result = cvv_result
          @fraud_service_result = fraud_service_result
        end

        # Sets the property and returns this same instance.
        def with_avs_result(value)
          @avs_result = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cvv_result(value)
          @cvv_result = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fraud_service_result(value)
          @fraud_service_result = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['avsResult'] = @avs_result unless @avs_result.nil?
          hash['cvvResult'] = @cvv_result unless @cvv_result.nil?
          hash['fraudServiceResult'] = @fraud_service_result unless @fraud_service_result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'avsResult'
            @avs_result = hash['avsResult']
          end
          if hash.key? 'cvvResult'
            @cvv_result = hash['cvvResult']
          end
          if hash.key? 'fraudServiceResult'
            @fraud_service_result = hash['fraudServiceResult']
          end
        end
      end
    end
  end
end
