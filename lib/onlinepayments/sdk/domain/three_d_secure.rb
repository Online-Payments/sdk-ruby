# frozen_string_literal: true

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
      # @attr [Integer, nil] authentication_amount
      # @attr [String, nil] challenge_canvas_size
      # @attr [String, nil] challenge_indicator
      # @attr [String, nil] device_channel
      # @attr [String, nil] exemption_request
      # @attr [OnlinePayments::SDK::Domain::ExternalCardholderAuthenticationData, nil] external_cardholder_authentication_data
      # @attr [Integer, nil] merchant_fraud_rate
      # @attr [OnlinePayments::SDK::Domain::ThreeDSecureData, nil] prior_three_d_secure_data
      # @attr [OnlinePayments::SDK::Domain::RedirectionData, nil] redirection_data
      # @attr [true/false, nil] secure_corporate_payment
      # @attr [true/false, nil] skip_authentication
      # @attr [true/false, nil] skip_soft_decline
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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(authentication_amount: nil,
                       challenge_canvas_size: nil,
                       challenge_indicator: nil,
                       device_channel: nil,
                       exemption_request: nil,
                       external_cardholder_authentication_data: nil,
                       merchant_fraud_rate: nil,
                       prior_three_d_secure_data: nil,
                       redirection_data: nil,
                       secure_corporate_payment: nil,
                       skip_authentication: nil,
                       skip_soft_decline: nil)
          super()
          @authentication_amount = authentication_amount
          @challenge_canvas_size = challenge_canvas_size
          @challenge_indicator = challenge_indicator
          @device_channel = device_channel
          @exemption_request = exemption_request
          @external_cardholder_authentication_data = external_cardholder_authentication_data
          @merchant_fraud_rate = merchant_fraud_rate
          @prior_three_d_secure_data = prior_three_d_secure_data
          @redirection_data = redirection_data
          @secure_corporate_payment = secure_corporate_payment
          @skip_authentication = skip_authentication
          @skip_soft_decline = skip_soft_decline
        end

        # Sets the property and returns this same instance.
        def with_authentication_amount(value)
          @authentication_amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_challenge_canvas_size(value)
          @challenge_canvas_size = value
          self
        end

        # Sets the property and returns this same instance.
        def with_challenge_indicator(value)
          @challenge_indicator = value
          self
        end

        # Sets the property and returns this same instance.
        def with_device_channel(value)
          @device_channel = value
          self
        end

        # Sets the property and returns this same instance.
        def with_exemption_request(value)
          @exemption_request = value
          self
        end

        # Sets the property and returns this same instance.
        def with_external_cardholder_authentication_data(value)
          @external_cardholder_authentication_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_fraud_rate(value)
          @merchant_fraud_rate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_prior_three_d_secure_data(value)
          @prior_three_d_secure_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirection_data(value)
          @redirection_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_secure_corporate_payment(value)
          @secure_corporate_payment = value
          self
        end

        # Sets the property and returns this same instance.
        def with_skip_authentication(value)
          @skip_authentication = value
          self
        end

        # Sets the property and returns this same instance.
        def with_skip_soft_decline(value)
          @skip_soft_decline = value
          self
        end

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
          if hash.key? 'authenticationAmount'
            @authentication_amount = hash['authenticationAmount']
          end
          if hash.key? 'challengeCanvasSize'
            @challenge_canvas_size = hash['challengeCanvasSize']
          end
          if hash.key? 'challengeIndicator'
            @challenge_indicator = hash['challengeIndicator']
          end
          if hash.key? 'deviceChannel'
            @device_channel = hash['deviceChannel']
          end
          if hash.key? 'exemptionRequest'
            @exemption_request = hash['exemptionRequest']
          end
          if hash.key? 'externalCardholderAuthenticationData'
            raise TypeError, "value '#{hash['externalCardholderAuthenticationData']}' is not a Hash" unless hash['externalCardholderAuthenticationData'].is_a? Hash
            @external_cardholder_authentication_data = OnlinePayments::SDK::Domain::ExternalCardholderAuthenticationData.new_from_hash(hash['externalCardholderAuthenticationData'])
          end
          if hash.key? 'merchantFraudRate'
            @merchant_fraud_rate = hash['merchantFraudRate']
          end
          if hash.key? 'priorThreeDSecureData'
            raise TypeError, "value '#{hash['priorThreeDSecureData']}' is not a Hash" unless hash['priorThreeDSecureData'].is_a? Hash
            @prior_three_d_secure_data = OnlinePayments::SDK::Domain::ThreeDSecureData.new_from_hash(hash['priorThreeDSecureData'])
          end
          if hash.key? 'redirectionData'
            raise TypeError, "value '#{hash['redirectionData']}' is not a Hash" unless hash['redirectionData'].is_a? Hash
            @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
          end
          if hash.key? 'secureCorporatePayment'
            @secure_corporate_payment = hash['secureCorporatePayment']
          end
          if hash.key? 'skipAuthentication'
            @skip_authentication = hash['skipAuthentication']
          end
          if hash.key? 'skipSoftDecline'
            @skip_soft_decline = hash['skipSoftDecline']
          end
        end
      end
    end
  end
end
