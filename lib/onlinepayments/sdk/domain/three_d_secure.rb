#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/external_cardholder_authentication_data'
require 'onlinepayments/sdk/domain/redirection_data'
require 'onlinepayments/sdk/domain/three_d_secure_data'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] authentication_amount
    # @attr [String] challenge_canvas_size
    # @attr [String] challenge_indicator
    # @attr [String] exemption_request
    # @attr [OnlinePayments::SDK::Domain::ExternalCardholderAuthenticationData] external_cardholder_authentication_data
    # @attr [Integer] merchant_fraud_rate
    # @attr [OnlinePayments::SDK::Domain::ThreeDSecureData] prior_three_d_secure_data
    # @attr [OnlinePayments::SDK::Domain::RedirectionData] redirection_data
    # @attr [true/false] secure_corporate_payment
    # @attr [true/false] skip_authentication
    # @attr [true/false] skip_soft_decline
    class ThreeDSecure < OnlinePayments::SDK::DataObject
      attr_accessor :authentication_amount
      attr_accessor :challenge_canvas_size
      attr_accessor :challenge_indicator
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
        hash['exemptionRequest'] = @exemption_request unless @exemption_request.nil?
        hash['externalCardholderAuthenticationData'] = @external_cardholder_authentication_data.to_h if @external_cardholder_authentication_data
        hash['merchantFraudRate'] = @merchant_fraud_rate unless @merchant_fraud_rate.nil?
        hash['priorThreeDSecureData'] = @prior_three_d_secure_data.to_h if @prior_three_d_secure_data
        hash['redirectionData'] = @redirection_data.to_h if @redirection_data
        hash['secureCorporatePayment'] = @secure_corporate_payment unless @secure_corporate_payment.nil?
        hash['skipAuthentication'] = @skip_authentication unless @skip_authentication.nil?
        hash['skipSoftDecline'] = @skip_soft_decline unless @skip_soft_decline.nil?
        hash
      end

      def from_hash(hash)
        super
        @authentication_amount = hash['authenticationAmount'] if hash.key? 'authenticationAmount'
        @challenge_canvas_size = hash['challengeCanvasSize'] if hash.key? 'challengeCanvasSize'
        @challenge_indicator = hash['challengeIndicator'] if hash.key? 'challengeIndicator'
        @exemption_request = hash['exemptionRequest'] if hash.key? 'exemptionRequest'
        if hash.key? 'externalCardholderAuthenticationData'
          raise TypeError, "value '%s' is not a Hash" % [hash['externalCardholderAuthenticationData']] unless hash['externalCardholderAuthenticationData'].is_a? Hash
          @external_cardholder_authentication_data = OnlinePayments::SDK::Domain::ExternalCardholderAuthenticationData.new_from_hash(hash['externalCardholderAuthenticationData'])
        end
        @merchant_fraud_rate = hash['merchantFraudRate'] if hash.key? 'merchantFraudRate'
        if hash.key? 'priorThreeDSecureData'
          raise TypeError, "value '%s' is not a Hash" % [hash['priorThreeDSecureData']] unless hash['priorThreeDSecureData'].is_a? Hash
          @prior_three_d_secure_data = OnlinePayments::SDK::Domain::ThreeDSecureData.new_from_hash(hash['priorThreeDSecureData'])
        end
        if hash.key? 'redirectionData'
          raise TypeError, "value '%s' is not a Hash" % [hash['redirectionData']] unless hash['redirectionData'].is_a? Hash
          @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
        end
        @secure_corporate_payment = hash['secureCorporatePayment'] if hash.key? 'secureCorporatePayment'
        @skip_authentication = hash['skipAuthentication'] if hash.key? 'skipAuthentication'
        @skip_soft_decline = hash['skipSoftDecline'] if hash.key? 'skipSoftDecline'
      end
    end
  end
end
