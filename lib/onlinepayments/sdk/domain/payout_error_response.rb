#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/payout_result'

module OnlinePayments::SDK
  module Domain

    # @attr [String] error_id
    # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
    # @attr [OnlinePayments::SDK::Domain::PayoutResult] payout_result
    class PayoutErrorResponse < OnlinePayments::SDK::DataObject
      attr_accessor :error_id
      attr_accessor :errors
      attr_accessor :payout_result

      # @return (Hash)
      def to_h
        hash = super
        hash['errorId'] = @error_id unless @error_id.nil?
        hash['errors'] = @errors.collect(&:to_h) if @errors
        hash['payoutResult'] = @payout_result.to_h if @payout_result
        hash
      end

      def from_hash(hash)
        super
        @error_id = hash['errorId'] if hash.key? 'errorId'
        if hash.key? 'errors'
          raise TypeError, "value '%s' is not an Array" % [hash['errors']] unless hash['errors'].is_a? Array
          @errors = []
          hash['errors'].each do |e|
            @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
          end
        end
        if hash.key? 'payoutResult'
          raise TypeError, "value '%s' is not a Hash" % [hash['payoutResult']] unless hash['payoutResult'].is_a? Hash
          @payout_result = OnlinePayments::SDK::Domain::PayoutResult.new_from_hash(hash['payoutResult'])
        end
      end
    end
  end
end
