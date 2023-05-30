#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/dcc_proposal'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] accepted_by_user
    # @attr [OnlinePayments::SDK::Domain::DccProposal] proposal
    class CurrencyConversion < OnlinePayments::SDK::DataObject
      attr_accessor :accepted_by_user
      attr_accessor :proposal

      # @return (Hash)
      def to_h
        hash = super
        hash['acceptedByUser'] = @accepted_by_user unless @accepted_by_user.nil?
        hash['proposal'] = @proposal.to_h if @proposal
        hash
      end

      def from_hash(hash)
        super
        @accepted_by_user = hash['acceptedByUser'] if hash.key? 'acceptedByUser'
        if hash.key? 'proposal'
          raise TypeError, "value '%s' is not a Hash" % [hash['proposal']] unless hash['proposal'].is_a? Hash
          @proposal = OnlinePayments::SDK::Domain::DccProposal.new_from_hash(hash['proposal'])
        end
      end
    end
  end
end
