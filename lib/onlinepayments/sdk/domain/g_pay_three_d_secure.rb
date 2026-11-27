# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/redirection_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] challenge_canvas_size
      # @attr [String, nil] challenge_indicator
      # @attr [String, nil] exemption_request
      # @attr [OnlinePayments::SDK::Domain::RedirectionData, nil] redirection_data
      # @attr [true/false, nil] skip_authentication
      # @attr [true/false, nil] skip_soft_decline
      class GPayThreeDSecure < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :challenge_canvas_size

        attr_accessor :challenge_indicator

        attr_accessor :exemption_request

        attr_accessor :redirection_data

        attr_accessor :skip_authentication

        attr_accessor :skip_soft_decline

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(challenge_canvas_size: nil,
                       challenge_indicator: nil,
                       exemption_request: nil,
                       redirection_data: nil,
                       skip_authentication: nil,
                       skip_soft_decline: nil)
          super()
          @challenge_canvas_size = challenge_canvas_size
          @challenge_indicator = challenge_indicator
          @exemption_request = exemption_request
          @redirection_data = redirection_data
          @skip_authentication = skip_authentication
          @skip_soft_decline = skip_soft_decline
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
        def with_exemption_request(value)
          @exemption_request = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirection_data(value)
          @redirection_data = value
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
          hash['challengeCanvasSize'] = @challenge_canvas_size unless @challenge_canvas_size.nil?
          hash['challengeIndicator'] = @challenge_indicator unless @challenge_indicator.nil?
          hash['exemptionRequest'] = @exemption_request unless @exemption_request.nil?
          hash['redirectionData'] = @redirection_data.to_h unless @redirection_data.nil?
          hash['skipAuthentication'] = @skip_authentication unless @skip_authentication.nil?
          hash['skipSoftDecline'] = @skip_soft_decline unless @skip_soft_decline.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'challengeCanvasSize'
            @challenge_canvas_size = hash['challengeCanvasSize']
          end
          if hash.key? 'challengeIndicator'
            @challenge_indicator = hash['challengeIndicator']
          end
          if hash.key? 'exemptionRequest'
            @exemption_request = hash['exemptionRequest']
          end
          if hash.key? 'redirectionData'
            raise TypeError, "value '#{hash['redirectionData']}' is not a Hash" unless hash['redirectionData'].is_a? Hash
            @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
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
