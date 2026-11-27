# frozen_string_literal: true

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
      # @attr [String, nil] action_type
      # @attr [OnlinePayments::SDK::Domain::MobileThreeDSecureChallengeParameters, nil] mobile_three_d_secure_challenge_parameters
      # @attr [OnlinePayments::SDK::Domain::RedirectData, nil] redirect_data
      # @attr [OnlinePayments::SDK::Domain::ShowFormData, nil] show_form_data
      # @attr [OnlinePayments::SDK::Domain::ShowInstructionsData, nil] show_instructions_data
      class MerchantAction < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :action_type

        attr_accessor :mobile_three_d_secure_challenge_parameters

        attr_accessor :redirect_data

        attr_accessor :show_form_data

        attr_accessor :show_instructions_data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(action_type: nil, mobile_three_d_secure_challenge_parameters: nil, redirect_data: nil, show_form_data: nil, show_instructions_data: nil)
          super()
          @action_type = action_type
          @mobile_three_d_secure_challenge_parameters = mobile_three_d_secure_challenge_parameters
          @redirect_data = redirect_data
          @show_form_data = show_form_data
          @show_instructions_data = show_instructions_data
        end

        # Sets the property and returns this same instance.
        def with_action_type(value)
          @action_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mobile_three_d_secure_challenge_parameters(value)
          @mobile_three_d_secure_challenge_parameters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirect_data(value)
          @redirect_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_show_form_data(value)
          @show_form_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_show_instructions_data(value)
          @show_instructions_data = value
          self
        end

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
          if hash.key? 'actionType'
            @action_type = hash['actionType']
          end
          if hash.key? 'mobileThreeDSecureChallengeParameters'
            raise TypeError, "value '#{hash['mobileThreeDSecureChallengeParameters']}' is not a Hash" unless hash['mobileThreeDSecureChallengeParameters'].is_a? Hash
            @mobile_three_d_secure_challenge_parameters = OnlinePayments::SDK::Domain::MobileThreeDSecureChallengeParameters.new_from_hash(hash['mobileThreeDSecureChallengeParameters'])
          end
          if hash.key? 'redirectData'
            raise TypeError, "value '#{hash['redirectData']}' is not a Hash" unless hash['redirectData'].is_a? Hash
            @redirect_data = OnlinePayments::SDK::Domain::RedirectData.new_from_hash(hash['redirectData'])
          end
          if hash.key? 'showFormData'
            raise TypeError, "value '#{hash['showFormData']}' is not a Hash" unless hash['showFormData'].is_a? Hash
            @show_form_data = OnlinePayments::SDK::Domain::ShowFormData.new_from_hash(hash['showFormData'])
          end
          if hash.key? 'showInstructionsData'
            raise TypeError, "value '#{hash['showInstructionsData']}' is not a Hash" unless hash['showInstructionsData'].is_a? Hash
            @show_instructions_data = OnlinePayments::SDK::Domain::ShowInstructionsData.new_from_hash(hash['showInstructionsData'])
          end
        end
      end
    end
  end
end
