#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mobile_three_d_secure_challenge_parameters'
require 'onlinepayments/sdk/domain/redirect_data'
require 'onlinepayments/sdk/domain/show_form_data'
require 'onlinepayments/sdk/domain/show_instructions_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] action_type
      # @attr [OnlinePayments::SDK::Domain::MobileThreeDSecureChallengeParameters] mobile_three_d_secure_challenge_parameters
      # @attr [OnlinePayments::SDK::Domain::RedirectData] redirect_data
      # @attr [OnlinePayments::SDK::Domain::ShowFormData] show_form_data
      # @attr [OnlinePayments::SDK::Domain::ShowInstructionsData] show_instructions_data
      class MerchantAction < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :action_type

        attr_accessor :mobile_three_d_secure_challenge_parameters

        attr_accessor :redirect_data

        attr_accessor :show_form_data

        attr_accessor :show_instructions_data

        # @return (Hash)
        def to_h
          hash = super
          hash['actionType'] = @action_type unless @action_type.nil?
          hash['mobileThreeDSecureChallengeParameters'] = @mobile_three_d_secure_challenge_parameters.to_h unless @mobile_three_d_secure_challenge_parameters.nil?
          hash['redirectData'] = @redirect_data.to_h unless @redirect_data.nil?
          hash['showFormData'] = @show_form_data.to_h unless @show_form_data.nil?
          hash['showInstructionsData'] = @show_instructions_data.to_h unless @show_instructions_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'actionType'
            @action_type = hash['actionType']
          end
          if hash.has_key? 'mobileThreeDSecureChallengeParameters'
            raise TypeError, "value '%s' is not a Hash" % [hash['mobileThreeDSecureChallengeParameters']] unless hash['mobileThreeDSecureChallengeParameters'].is_a? Hash
            @mobile_three_d_secure_challenge_parameters = OnlinePayments::SDK::Domain::MobileThreeDSecureChallengeParameters.new_from_hash(hash['mobileThreeDSecureChallengeParameters'])
          end
          if hash.has_key? 'redirectData'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectData']] unless hash['redirectData'].is_a? Hash
            @redirect_data = OnlinePayments::SDK::Domain::RedirectData.new_from_hash(hash['redirectData'])
          end
          if hash.has_key? 'showFormData'
            raise TypeError, "value '%s' is not a Hash" % [hash['showFormData']] unless hash['showFormData'].is_a? Hash
            @show_form_data = OnlinePayments::SDK::Domain::ShowFormData.new_from_hash(hash['showFormData'])
          end
          if hash.has_key? 'showInstructionsData'
            raise TypeError, "value '%s' is not a Hash" % [hash['showInstructionsData']] unless hash['showInstructionsData'].is_a? Hash
            @show_instructions_data = OnlinePayments::SDK::Domain::ShowInstructionsData.new_from_hash(hash['showInstructionsData'])
          end
        end
      end
    end
  end
end
