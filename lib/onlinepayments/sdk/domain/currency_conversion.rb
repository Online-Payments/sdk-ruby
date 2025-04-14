#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/dcc_proposal'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] accepted_by_user
      # @attr [OnlinePayments::SDK::Domain::DccProposal] proposal
      class CurrencyConversion < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accepted_by_user

        attr_accessor :proposal

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptedByUser'] = @accepted_by_user unless @accepted_by_user.nil?
          hash['proposal'] = @proposal.to_h unless @proposal.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acceptedByUser'
            @accepted_by_user = hash['acceptedByUser']
          end
          if hash.has_key? 'proposal'
            raise TypeError, "value '%s' is not a Hash" % [hash['proposal']] unless hash['proposal'].is_a? Hash
            @proposal = OnlinePayments::SDK::Domain::DccProposal.new_from_hash(hash['proposal'])
          end
        end
      end
    end
  end
end
