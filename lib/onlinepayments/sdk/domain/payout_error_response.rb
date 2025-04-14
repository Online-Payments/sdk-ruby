#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payout_result'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] error_id
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
      # @attr [OnlinePayments::SDK::Domain::PayoutResult] payout_result
      class PayoutErrorResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :error_id

        attr_accessor :errors

        attr_accessor :payout_result

        # @return (Hash)
        def to_h
          hash = super
          hash['errorId'] = @error_id unless @error_id.nil?
          hash['errors'] = @errors.collect{|val| val.to_h} unless @errors.nil?
          hash['payoutResult'] = @payout_result.to_h unless @payout_result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'errorId'
            @error_id = hash['errorId']
          end
          if hash.has_key? 'errors'
            raise TypeError, "value '%s' is not an Array" % [hash['errors']] unless hash['errors'].is_a? Array
            @errors = []
            hash['errors'].each do |e|
              @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
            end
          end
          if hash.has_key? 'payoutResult'
            raise TypeError, "value '%s' is not a Hash" % [hash['payoutResult']] unless hash['payoutResult'].is_a? Hash
            @payout_result = OnlinePayments::SDK::Domain::PayoutResult.new_from_hash(hash['payoutResult'])
          end
        end
      end
    end
  end
end
