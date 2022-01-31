#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/redirection_data'

module OnlinePayments::SDK
  module Domain

    # @attr [String] challenge_canvas_size
    # @attr [String] challenge_indicator
    # @attr [String] exemption_request
    # @attr [OnlinePayments::SDK::Domain::RedirectionData] redirection_data
    # @attr [true/false] skip_authentication
    class GPayThreeDSecure < OnlinePayments::SDK::DataObject
      attr_accessor :challenge_canvas_size
      attr_accessor :challenge_indicator
      attr_accessor :exemption_request
      attr_accessor :redirection_data
      attr_accessor :skip_authentication

      # @return (Hash)
      def to_h
        hash = super
        hash['challengeCanvasSize'] = @challenge_canvas_size unless @challenge_canvas_size.nil?
        hash['challengeIndicator'] = @challenge_indicator unless @challenge_indicator.nil?
        hash['exemptionRequest'] = @exemption_request unless @exemption_request.nil?
        hash['redirectionData'] = @redirection_data.to_h if @redirection_data
        hash['skipAuthentication'] = @skip_authentication unless @skip_authentication.nil?
        hash
      end

      def from_hash(hash)
        super
        @challenge_canvas_size = hash['challengeCanvasSize'] if hash.key? 'challengeCanvasSize'
        @challenge_indicator = hash['challengeIndicator'] if hash.key? 'challengeIndicator'
        @exemption_request = hash['exemptionRequest'] if hash.key? 'exemptionRequest'
        if hash.key? 'redirectionData'
          raise TypeError, "value '%s' is not a Hash" % [hash['redirectionData']] unless hash['redirectionData'].is_a? Hash
          @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
        end
        @skip_authentication = hash['skipAuthentication'] if hash.key? 'skipAuthentication'
      end
    end
  end
end
