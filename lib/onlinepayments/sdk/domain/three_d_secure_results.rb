#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] acs_transaction_id
      # @attr [String] applied_exemption
      # @attr [String] authentication_status
      # @attr [String] cavv
      # @attr [String] challenge_indicator
      # @attr [String] ds_transaction_id
      # @attr [String] eci
      # @attr [String] exemption_engine_flow
      # @attr [String] flow
      # @attr [String] liability
      # @attr [String] scheme_eci
      # @attr [String] version
      # @attr [String] xid
      class ThreeDSecureResults < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acs_transaction_id

        attr_accessor :applied_exemption

        attr_accessor :authentication_status

        attr_accessor :cavv

        attr_accessor :challenge_indicator

        attr_accessor :ds_transaction_id

        attr_accessor :eci

        attr_accessor :exemption_engine_flow

        attr_accessor :flow

        attr_accessor :liability

        attr_accessor :scheme_eci

        attr_accessor :version

        attr_accessor :xid

        # @return (Hash)
        def to_h
          hash = super
          hash['acsTransactionId'] = @acs_transaction_id unless @acs_transaction_id.nil?
          hash['appliedExemption'] = @applied_exemption unless @applied_exemption.nil?
          hash['authenticationStatus'] = @authentication_status unless @authentication_status.nil?
          hash['cavv'] = @cavv unless @cavv.nil?
          hash['challengeIndicator'] = @challenge_indicator unless @challenge_indicator.nil?
          hash['dsTransactionId'] = @ds_transaction_id unless @ds_transaction_id.nil?
          hash['eci'] = @eci unless @eci.nil?
          hash['exemptionEngineFlow'] = @exemption_engine_flow unless @exemption_engine_flow.nil?
          hash['flow'] = @flow unless @flow.nil?
          hash['liability'] = @liability unless @liability.nil?
          hash['schemeEci'] = @scheme_eci unless @scheme_eci.nil?
          hash['version'] = @version unless @version.nil?
          hash['xid'] = @xid unless @xid.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acsTransactionId'
            @acs_transaction_id = hash['acsTransactionId']
          end
          if hash.has_key? 'appliedExemption'
            @applied_exemption = hash['appliedExemption']
          end
          if hash.has_key? 'authenticationStatus'
            @authentication_status = hash['authenticationStatus']
          end
          if hash.has_key? 'cavv'
            @cavv = hash['cavv']
          end
          if hash.has_key? 'challengeIndicator'
            @challenge_indicator = hash['challengeIndicator']
          end
          if hash.has_key? 'dsTransactionId'
            @ds_transaction_id = hash['dsTransactionId']
          end
          if hash.has_key? 'eci'
            @eci = hash['eci']
          end
          if hash.has_key? 'exemptionEngineFlow'
            @exemption_engine_flow = hash['exemptionEngineFlow']
          end
          if hash.has_key? 'flow'
            @flow = hash['flow']
          end
          if hash.has_key? 'liability'
            @liability = hash['liability']
          end
          if hash.has_key? 'schemeEci'
            @scheme_eci = hash['schemeEci']
          end
          if hash.has_key? 'version'
            @version = hash['version']
          end
          if hash.has_key? 'xid'
            @xid = hash['xid']
          end
        end
      end
    end
  end
end
