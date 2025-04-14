#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/create_payment_response'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] error_id
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
      # @attr [OnlinePayments::SDK::Domain::CreatePaymentResponse] payment_result
      class PaymentErrorResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :error_id

        attr_accessor :errors

        attr_accessor :payment_result

        # @return (Hash)
        def to_h
          hash = super
          hash['errorId'] = @error_id unless @error_id.nil?
          hash['errors'] = @errors.collect{|val| val.to_h} unless @errors.nil?
          hash['paymentResult'] = @payment_result.to_h unless @payment_result.nil?
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
          if hash.has_key? 'paymentResult'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentResult']] unless hash['paymentResult'].is_a? Hash
            @payment_result = OnlinePayments::SDK::Domain::CreatePaymentResponse.new_from_hash(hash['paymentResult'])
          end
        end
      end
    end
  end
end
