# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payout_output'
require 'onlinepayments/sdk/domain/payout_status_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] id
      # @attr [OnlinePayments::SDK::Domain::PayoutOutput, nil] payout_output
      # @attr [String, nil] status
      # @attr [OnlinePayments::SDK::Domain::PayoutStatusOutput, nil] status_output
      class PayoutResult < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :payout_output

        attr_accessor :status

        attr_accessor :status_output

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(id: nil, payout_output: nil, status: nil, status_output: nil)
          super()
          @id = id
          @payout_output = payout_output
          @status = status
          @status_output = status_output
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payout_output(value)
          @payout_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_output(value)
          @status_output = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['id'] = @id unless @id.nil?
          hash['payoutOutput'] = @payout_output.to_h unless @payout_output.nil?
          hash['status'] = @status unless @status.nil?
          hash['statusOutput'] = @status_output.to_h unless @status_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'payoutOutput'
            raise TypeError, "value '#{hash['payoutOutput']}' is not a Hash" unless hash['payoutOutput'].is_a? Hash
            @payout_output = OnlinePayments::SDK::Domain::PayoutOutput.new_from_hash(hash['payoutOutput'])
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'statusOutput'
            raise TypeError, "value '#{hash['statusOutput']}' is not a Hash" unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PayoutStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
