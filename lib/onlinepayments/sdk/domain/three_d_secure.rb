#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/external_cardholder_authentication_data'
require 'onlinepayments/sdk/domain/redirection_data'
require 'onlinepayments/sdk/domain/three_d_secure_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] authentication_amount
      # @attr [String] challenge_canvas_size
      # @attr [String] challenge_indicator
      # @attr [String] device_channel
      # @attr [String] exemption_request
      # @attr [OnlinePayments::SDK::Domain::ExternalCardholderAuthenticationData] external_cardholder_authentication_data
      # @attr [Integer] merchant_fraud_rate
      # @attr [OnlinePayments::SDK::Domain::ThreeDSecureData] prior_three_d_secure_data
      # @attr [OnlinePayments::SDK::Domain::RedirectionData] redirection_data
      # @attr [true/false] secure_corporate_payment
      # @attr [true/false] skip_authentication
      # @attr [true/false] skip_soft_decline
      class ThreeDSecure < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authentication_amount

        attr_accessor :challenge_canvas_size

        attr_accessor :challenge_indicator

        attr_accessor :device_channel

        attr_accessor :exemption_request

        attr_accessor :external_cardholder_authentication_data

        attr_accessor :merchant_fraud_rate

        attr_accessor :prior_three_d_secure_data

        attr_accessor :redirection_data

        attr_accessor :secure_corporate_payment

        attr_accessor :skip_authentication

        attr_accessor :skip_soft_decline

        # @return (Hash)
        def to_h
          hash = super
          hash['authenticationAmount'] = @authentication_amount unless @authentication_amount.nil?
          hash['challengeCanvasSize'] = @challenge_canvas_size unless @challenge_canvas_size.nil?
          hash['challengeIndicator'] = @challenge_indicator unless @challenge_indicator.nil?
          hash['deviceChannel'] = @device_channel unless @device_channel.nil?
          hash['exemptionRequest'] = @exemption_request unless @exemption_request.nil?
          hash['externalCardholderAuthenticationData'] = @external_cardholder_authentication_data.to_h unless @external_cardholder_authentication_data.nil?
          hash['merchantFraudRate'] = @merchant_fraud_rate unless @merchant_fraud_rate.nil?
          hash['priorThreeDSecureData'] = @prior_three_d_secure_data.to_h unless @prior_three_d_secure_data.nil?
          hash['redirectionData'] = @redirection_data.to_h unless @redirection_data.nil?
          hash['secureCorporatePayment'] = @secure_corporate_payment unless @secure_corporate_payment.nil?
          hash['skipAuthentication'] = @skip_authentication unless @skip_authentication.nil?
          hash['skipSoftDecline'] = @skip_soft_decline unless @skip_soft_decline.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'authenticationAmount'
            @authentication_amount = hash['authenticationAmount']
          end
          if hash.has_key? 'challengeCanvasSize'
            @challenge_canvas_size = hash['challengeCanvasSize']
          end
          if hash.has_key? 'challengeIndicator'
            @challenge_indicator = hash['challengeIndicator']
          end
          if hash.has_key? 'deviceChannel'
            @device_channel = hash['deviceChannel']
          end
          if hash.has_key? 'exemptionRequest'
            @exemption_request = hash['exemptionRequest']
          end
          if hash.has_key? 'externalCardholderAuthenticationData'
            raise TypeError, "value '%s' is not a Hash" % [hash['externalCardholderAuthenticationData']] unless hash['externalCardholderAuthenticationData'].is_a? Hash
            @external_cardholder_authentication_data = OnlinePayments::SDK::Domain::ExternalCardholderAuthenticationData.new_from_hash(hash['externalCardholderAuthenticationData'])
          end
          if hash.has_key? 'merchantFraudRate'
            @merchant_fraud_rate = hash['merchantFraudRate']
          end
          if hash.has_key? 'priorThreeDSecureData'
            raise TypeError, "value '%s' is not a Hash" % [hash['priorThreeDSecureData']] unless hash['priorThreeDSecureData'].is_a? Hash
            @prior_three_d_secure_data = OnlinePayments::SDK::Domain::ThreeDSecureData.new_from_hash(hash['priorThreeDSecureData'])
          end
          if hash.has_key? 'redirectionData'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectionData']] unless hash['redirectionData'].is_a? Hash
            @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
          end
          if hash.has_key? 'secureCorporatePayment'
            @secure_corporate_payment = hash['secureCorporatePayment']
          end
          if hash.has_key? 'skipAuthentication'
            @skip_authentication = hash['skipAuthentication']
          end
          if hash.has_key? 'skipSoftDecline'
            @skip_soft_decline = hash['skipSoftDecline']
          end
        end
      end
    end
  end
end
