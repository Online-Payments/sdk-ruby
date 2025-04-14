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
      # @attr [String] authorisation_code
      # @attr [OnlinePayments::SDK::Domain::CardFraudResults] fraud_results
      # @attr [String] network
      # @attr [OnlinePayments::SDK::Domain::MobilePaymentData] payment_data
      # @attr [Integer] payment_product_id
      # @attr [OnlinePayments::SDK::Domain::ThreeDSecureResults] three_d_secure_results
      class MobilePaymentMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorisation_code

        attr_accessor :fraud_results

        attr_accessor :network

        attr_accessor :payment_data

        attr_accessor :payment_product_id

        attr_accessor :three_d_secure_results

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
          if hash.has_key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.has_key? 'fraudResults'
            raise TypeError, "value '%s' is not a Hash" % [hash['fraudResults']] unless hash['fraudResults'].is_a? Hash
            @fraud_results = OnlinePayments::SDK::Domain::CardFraudResults.new_from_hash(hash['fraudResults'])
          end
          if hash.has_key? 'network'
            @network = hash['network']
          end
          if hash.has_key? 'paymentData'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentData']] unless hash['paymentData'].is_a? Hash
            @payment_data = OnlinePayments::SDK::Domain::MobilePaymentData.new_from_hash(hash['paymentData'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'threeDSecureResults'
            raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecureResults']] unless hash['threeDSecureResults'].is_a? Hash
            @three_d_secure_results = OnlinePayments::SDK::Domain::ThreeDSecureResults.new_from_hash(hash['threeDSecureResults'])
          end
        end
      end
    end
  end
end
