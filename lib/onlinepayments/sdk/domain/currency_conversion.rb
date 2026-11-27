# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/dcc_proposal'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] accepted_by_user
      # @attr [OnlinePayments::SDK::Domain::DccProposal, nil] proposal
      class CurrencyConversion < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accepted_by_user

        attr_accessor :proposal

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(accepted_by_user: nil, proposal: nil)
          super()
          @accepted_by_user = accepted_by_user
          @proposal = proposal
        end

        # Sets the property and returns this same instance.
        def with_accepted_by_user(value)
          @accepted_by_user = value
          self
        end

        # Sets the property and returns this same instance.
        def with_proposal(value)
          @proposal = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptedByUser'] = @accepted_by_user unless @accepted_by_user.nil?
          hash['proposal'] = @proposal.to_h unless @proposal.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acceptedByUser'
            @accepted_by_user = hash['acceptedByUser']
          end
          if hash.key? 'proposal'
            raise TypeError, "value '#{hash['proposal']}' is not a Hash" unless hash['proposal'].is_a? Hash
            @proposal = OnlinePayments::SDK::Domain::DccProposal.new_from_hash(hash['proposal'])
          end
        end
      end
    end
  end
end
