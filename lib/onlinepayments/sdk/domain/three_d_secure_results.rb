#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
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
    class ThreeDSecureResults < OnlinePayments::SDK::DataObject
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
        @acs_transaction_id = hash['acsTransactionId'] if hash.key? 'acsTransactionId'
        @applied_exemption = hash['appliedExemption'] if hash.key? 'appliedExemption'
        @authentication_status = hash['authenticationStatus'] if hash.key? 'authenticationStatus'
        @cavv = hash['cavv'] if hash.key? 'cavv'
        @challenge_indicator = hash['challengeIndicator'] if hash.key? 'challengeIndicator'
        @ds_transaction_id = hash['dsTransactionId'] if hash.key? 'dsTransactionId'
        @eci = hash['eci'] if hash.key? 'eci'
        @exemption_engine_flow = hash['exemptionEngineFlow'] if hash.key? 'exemptionEngineFlow'
        @flow = hash['flow'] if hash.key? 'flow'
        @liability = hash['liability'] if hash.key? 'liability'
        @scheme_eci = hash['schemeEci'] if hash.key? 'schemeEci'
        @version = hash['version'] if hash.key? 'version'
        @xid = hash['xid'] if hash.key? 'xid'
      end
    end
  end
end
