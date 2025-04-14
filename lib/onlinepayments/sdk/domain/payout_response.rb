#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payout_output'
require 'onlinepayments/sdk/domain/payout_status_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] id
      # @attr [OnlinePayments::SDK::Domain::PayoutOutput] payout_output
      # @attr [String] status
      # @attr [OnlinePayments::SDK::Domain::PayoutStatusOutput] status_output
      class PayoutResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :id

        attr_accessor :payout_output

        attr_accessor :status

        attr_accessor :status_output

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
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'payoutOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['payoutOutput']] unless hash['payoutOutput'].is_a? Hash
            @payout_output = OnlinePayments::SDK::Domain::PayoutOutput.new_from_hash(hash['payoutOutput'])
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'statusOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::PayoutStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
