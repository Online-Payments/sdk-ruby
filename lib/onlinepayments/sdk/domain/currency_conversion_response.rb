#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/currency_conversion_result'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/dcc_proposal'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] dcc_session_id
      # @attr [OnlinePayments::SDK::Domain::DccProposal] proposal
      # @attr [OnlinePayments::SDK::Domain::CurrencyConversionResult] result
      class CurrencyConversionResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dcc_session_id

        attr_accessor :proposal

        attr_accessor :result

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
          if hash.has_key? 'dccSessionId'
            @dcc_session_id = hash['dccSessionId']
          end
          if hash.has_key? 'proposal'
            raise TypeError, "value '%s' is not a Hash" % [hash['proposal']] unless hash['proposal'].is_a? Hash
            @proposal = OnlinePayments::SDK::Domain::DccProposal.new_from_hash(hash['proposal'])
          end
          if hash.has_key? 'result'
            raise TypeError, "value '%s' is not a Hash" % [hash['result']] unless hash['result'].is_a? Hash
            @result = OnlinePayments::SDK::Domain::CurrencyConversionResult.new_from_hash(hash['result'])
          end
        end
      end
    end
  end
end
