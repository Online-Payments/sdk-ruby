#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payout_output'
require 'onlinepayments/sdk/domain/payout_status_output'

module OnlinePayments::SDK
  module Domain

    # @attr [String] id
    # @attr [OnlinePayments::SDK::Domain::PayoutOutput] payout_output
    # @attr [String] status
    # @attr [OnlinePayments::SDK::Domain::PayoutStatusOutput] status_output
    class PayoutResponse < OnlinePayments::SDK::DataObject
      attr_accessor :id
      attr_accessor :payout_output
      attr_accessor :status
      attr_accessor :status_output

      # @return (Hash)
      def to_h
        hash = super
        hash['id'] = @id unless @id.nil?
        hash['payoutOutput'] = @payout_output.to_h if @payout_output
        hash['status'] = @status unless @status.nil?
        hash['statusOutput'] = @status_output.to_h if @status_output
        hash
      end

      def from_hash(hash)
        super
        @id = hash['id'] if hash.key? 'id'
        if hash.key? 'payoutOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['payoutOutput']] unless hash['payoutOutput'].is_a? Hash
          @payout_output = OnlinePayments::SDK::Domain::PayoutOutput.new_from_hash(hash['payoutOutput'])
        end
        @status = hash['status'] if hash.key? 'status'
        if hash.key? 'statusOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
          @status_output = OnlinePayments::SDK::Domain::PayoutStatusOutput.new_from_hash(hash['statusOutput'])
        end
      end
    end
  end
end
