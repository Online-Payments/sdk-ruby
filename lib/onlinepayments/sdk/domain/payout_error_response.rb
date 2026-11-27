# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payout_result'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] error_id
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>, nil] errors
      # @attr [OnlinePayments::SDK::Domain::PayoutResult, nil] payout_result
      class PayoutErrorResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :error_id

        attr_accessor :errors

        attr_accessor :payout_result

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(error_id: nil, errors: nil, payout_result: nil)
          super()
          @error_id = error_id
          @errors = errors
          @payout_result = payout_result
        end

        # Sets the property and returns this same instance.
        def with_error_id(value)
          @error_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_errors(value)
          @errors = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payout_result(value)
          @payout_result = value
          self
        end

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
          if hash.key? 'errorId'
            @error_id = hash['errorId']
          end
          if hash.key? 'errors'
            raise TypeError, "value '#{hash['errors']}' is not an Array" unless hash['errors'].is_a? Array
            @errors = []
            hash['errors'].each do |e|
              @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
            end
          end
          if hash.key? 'payoutResult'
            raise TypeError, "value '#{hash['payoutResult']}' is not a Hash" unless hash['payoutResult'].is_a? Hash
            @payout_result = OnlinePayments::SDK::Domain::PayoutResult.new_from_hash(hash['payoutResult'])
          end
        end
      end
    end
  end
end
