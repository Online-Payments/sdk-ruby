# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_fraud_results'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mobile_payment_data'
require 'onlinepayments/sdk/domain/three_d_secure_results'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] authorisation_code
      # @attr [OnlinePayments::SDK::Domain::CardFraudResults, nil] fraud_results
      # @attr [String, nil] network
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentData, nil] payment_data
      # @attr [Integer, nil] payment_product_id
      # @attr [OnlinePayments::SDK::Domain::ThreeDSecureResults, nil] three_d_secure_results
      class MobilePaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorisation_code

        attr_accessor :fraud_results

        attr_accessor :network

        attr_accessor :payment_data

        attr_accessor :payment_product_id

        attr_accessor :three_d_secure_results

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(authorisation_code: nil, fraud_results: nil, network: nil, payment_data: nil, payment_product_id: nil, three_d_secure_results: nil)
          super()
          @authorisation_code = authorisation_code
          @fraud_results = fraud_results
          @network = network
          @payment_data = payment_data
          @payment_product_id = payment_product_id
          @three_d_secure_results = three_d_secure_results
        end

        # Sets the property and returns this same instance.
        def with_authorisation_code(value)
          @authorisation_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_fraud_results(value)
          @fraud_results = value
          self
        end

        # Sets the property and returns this same instance.
        def with_network(value)
          @network = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_data(value)
          @payment_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_three_d_secure_results(value)
          @three_d_secure_results = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
          hash['fraudResults'] = @fraud_results.to_h unless @fraud_results.nil?
          hash['network'] = @network unless @network.nil?
          hash['paymentData'] = @payment_data.to_h unless @payment_data.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['threeDSecureResults'] = @three_d_secure_results.to_h unless @three_d_secure_results.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.key? 'fraudResults'
            raise TypeError, "value '#{hash['fraudResults']}' is not a Hash" unless hash['fraudResults'].is_a? Hash
            @fraud_results = OnlinePayments::SDK::Domain::CardFraudResults.new_from_hash(hash['fraudResults'])
          end
          if hash.key? 'network'
            @network = hash['network']
          end
          if hash.key? 'paymentData'
            raise TypeError, "value '#{hash['paymentData']}' is not a Hash" unless hash['paymentData'].is_a? Hash
            @payment_data = OnlinePayments::SDK::Domain::MobilePaymentData.new_from_hash(hash['paymentData'])
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.key? 'threeDSecureResults'
            raise TypeError, "value '#{hash['threeDSecureResults']}' is not a Hash" unless hash['threeDSecureResults'].is_a? Hash
            @three_d_secure_results = OnlinePayments::SDK::Domain::ThreeDSecureResults.new_from_hash(hash['threeDSecureResults'])
          end
        end
      end
    end
  end
end
