# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] error_id
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>, nil] errors
      # @attr [OnlinePayments::SDK::Domain::RefundResponse, nil] refund_result
      class RefundErrorResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :error_id

        attr_accessor :errors

        attr_accessor :refund_result

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(error_id: nil, errors: nil, refund_result: nil)
          super()
          @error_id = error_id
          @errors = errors
          @refund_result = refund_result
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
        def with_refund_result(value)
          @refund_result = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['errorId'] = @error_id unless @error_id.nil?
          hash['errors'] = @errors.collect{|val| val.to_h} unless @errors.nil?
          hash['refundResult'] = @refund_result.to_h unless @refund_result.nil?
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
          if hash.key? 'refundResult'
            raise TypeError, "value '#{hash['refundResult']}' is not a Hash" unless hash['refundResult'].is_a? Hash
            @refund_result = OnlinePayments::SDK::Domain::RefundResponse.new_from_hash(hash['refundResult'])
          end
        end
      end
    end
  end
end
