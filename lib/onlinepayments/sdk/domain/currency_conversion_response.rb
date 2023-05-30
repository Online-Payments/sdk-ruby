#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/currency_conversion_result'
require 'onlinepayments/sdk/domain/dcc_proposal'

module OnlinePayments::SDK
  module Domain

    # @attr [String] dcc_session_id
    # @attr [OnlinePayments::SDK::Domain::DccProposal] proposal
    # @attr [OnlinePayments::SDK::Domain::CurrencyConversionResult] result
    class CurrencyConversionResponse < OnlinePayments::SDK::DataObject
      attr_accessor :dcc_session_id
      attr_accessor :proposal
      attr_accessor :result

      # @return (Hash)
      def to_h
        hash = super
        hash['dccSessionId'] = @dcc_session_id unless @dcc_session_id.nil?
        hash['proposal'] = @proposal.to_h if @proposal
        hash['result'] = @result.to_h if @result
        hash
      end

      def from_hash(hash)
        super
        @dcc_session_id = hash['dccSessionId'] if hash.key? 'dccSessionId'
        if hash.key? 'proposal'
          raise TypeError, "value '%s' is not a Hash" % [hash['proposal']] unless hash['proposal'].is_a? Hash
          @proposal = OnlinePayments::SDK::Domain::DccProposal.new_from_hash(hash['proposal'])
        end
        if hash.key? 'result'
          raise TypeError, "value '%s' is not a Hash" % [hash['result']] unless hash['result'].is_a? Hash
          @result = OnlinePayments::SDK::Domain::CurrencyConversionResult.new_from_hash(hash['result'])
        end
      end
    end
  end
end
