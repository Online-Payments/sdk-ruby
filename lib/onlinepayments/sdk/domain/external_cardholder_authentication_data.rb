# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] acs_transaction_id
      # @attr [String, nil] applied_exemption
      # @attr [String, nil] cavv
      # @attr [String, nil] cavv_algorithm
      # @attr [String, nil] directory_server_transaction_id
      # @attr [Integer, nil] eci
      # @attr [String, nil] flow
      # @attr [Integer, nil] scheme_risk_score
      # @attr [String, nil] three_d_secure_version
      # @attr [String, nil] xid
      class ExternalCardholderAuthenticationData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acs_transaction_id

        attr_accessor :applied_exemption

        attr_accessor :cavv

        attr_accessor :cavv_algorithm

        attr_accessor :directory_server_transaction_id

        attr_accessor :eci

        attr_accessor :flow

        attr_accessor :scheme_risk_score

        attr_accessor :three_d_secure_version

        attr_accessor :xid

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acs_transaction_id: nil,
                       applied_exemption: nil,
                       cavv: nil,
                       cavv_algorithm: nil,
                       directory_server_transaction_id: nil,
                       eci: nil,
                       flow: nil,
                       scheme_risk_score: nil,
                       three_d_secure_version: nil,
                       xid: nil)
          super()
          @acs_transaction_id = acs_transaction_id
          @applied_exemption = applied_exemption
          @cavv = cavv
          @cavv_algorithm = cavv_algorithm
          @directory_server_transaction_id = directory_server_transaction_id
          @eci = eci
          @flow = flow
          @scheme_risk_score = scheme_risk_score
          @three_d_secure_version = three_d_secure_version
          @xid = xid
        end

        # Sets the property and returns this same instance.
        def with_acs_transaction_id(value)
          @acs_transaction_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_applied_exemption(value)
          @applied_exemption = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cavv(value)
          @cavv = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cavv_algorithm(value)
          @cavv_algorithm = value
          self
        end

        # Sets the property and returns this same instance.
        def with_directory_server_transaction_id(value)
          @directory_server_transaction_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_eci(value)
          @eci = value
          self
        end

        # Sets the property and returns this same instance.
        def with_flow(value)
          @flow = value
          self
        end

        # Sets the property and returns this same instance.
        def with_scheme_risk_score(value)
          @scheme_risk_score = value
          self
        end

        # Sets the property and returns this same instance.
        def with_three_d_secure_version(value)
          @three_d_secure_version = value
          self
        end

        # Sets the property and returns this same instance.
        def with_xid(value)
          @xid = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acsTransactionId'] = @acs_transaction_id unless @acs_transaction_id.nil?
          hash['appliedExemption'] = @applied_exemption unless @applied_exemption.nil?
          hash['cavv'] = @cavv unless @cavv.nil?
          hash['cavvAlgorithm'] = @cavv_algorithm unless @cavv_algorithm.nil?
          hash['directoryServerTransactionId'] = @directory_server_transaction_id unless @directory_server_transaction_id.nil?
          hash['eci'] = @eci unless @eci.nil?
          hash['flow'] = @flow unless @flow.nil?
          hash['schemeRiskScore'] = @scheme_risk_score unless @scheme_risk_score.nil?
          hash['threeDSecureVersion'] = @three_d_secure_version unless @three_d_secure_version.nil?
          hash['xid'] = @xid unless @xid.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acsTransactionId'
            @acs_transaction_id = hash['acsTransactionId']
          end
          if hash.key? 'appliedExemption'
            @applied_exemption = hash['appliedExemption']
          end
          if hash.key? 'cavv'
            @cavv = hash['cavv']
          end
          if hash.key? 'cavvAlgorithm'
            @cavv_algorithm = hash['cavvAlgorithm']
          end
          if hash.key? 'directoryServerTransactionId'
            @directory_server_transaction_id = hash['directoryServerTransactionId']
          end
          if hash.key? 'eci'
            @eci = hash['eci']
          end
          if hash.key? 'flow'
            @flow = hash['flow']
          end
          if hash.key? 'schemeRiskScore'
            @scheme_risk_score = hash['schemeRiskScore']
          end
          if hash.key? 'threeDSecureVersion'
            @three_d_secure_version = hash['threeDSecureVersion']
          end
          if hash.key? 'xid'
            @xid = hash['xid']
          end
        end
      end
    end
  end
end
