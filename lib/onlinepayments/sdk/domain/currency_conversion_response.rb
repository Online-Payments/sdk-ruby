# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/currency_conversion_result'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/dcc_proposal'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] dcc_session_id
      # @attr [OnlinePayments::SDK::Domain::DccProposal, nil] proposal
      # @attr [OnlinePayments::SDK::Domain::CurrencyConversionResult, nil] result
      class CurrencyConversionResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dcc_session_id

        attr_accessor :proposal

        attr_accessor :result

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(dcc_session_id: nil, proposal: nil, result: nil)
          super()
          @dcc_session_id = dcc_session_id
          @proposal = proposal
          @result = result
        end

        # Sets the property and returns this same instance.
        def with_dcc_session_id(value)
          @dcc_session_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_proposal(value)
          @proposal = value
          self
        end

        # Sets the property and returns this same instance.
        def with_result(value)
          @result = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['dccSessionId'] = @dcc_session_id unless @dcc_session_id.nil?
          hash['proposal'] = @proposal.to_h unless @proposal.nil?
          hash['result'] = @result.to_h unless @result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'dccSessionId'
            @dcc_session_id = hash['dccSessionId']
          end
          if hash.key? 'proposal'
            raise TypeError, "value '#{hash['proposal']}' is not a Hash" unless hash['proposal'].is_a? Hash
            @proposal = OnlinePayments::SDK::Domain::DccProposal.new_from_hash(hash['proposal'])
          end
          if hash.key? 'result'
            raise TypeError, "value '#{hash['result']}' is not a Hash" unless hash['result'].is_a? Hash
            @result = OnlinePayments::SDK::Domain::CurrencyConversionResult.new_from_hash(hash['result'])
          end
        end
      end
    end
  end
end
