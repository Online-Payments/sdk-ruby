#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/create_payment_response'

module OnlinePayments::SDK
  module Domain

    # @attr [String] error_id
    # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
    # @attr [OnlinePayments::SDK::Domain::CreatePaymentResponse] payment_result
    class PaymentErrorResponse < OnlinePayments::SDK::DataObject
      attr_accessor :error_id
      attr_accessor :errors
      attr_accessor :payment_result

      # @return (Hash)
      def to_h
        hash = super
        hash['errorId'] = @error_id unless @error_id.nil?
        hash['errors'] = @errors.collect(&:to_h) if @errors
        hash['paymentResult'] = @payment_result.to_h if @payment_result
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
        if hash.key? 'paymentResult'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentResult']] unless hash['paymentResult'].is_a? Hash
          @payment_result = OnlinePayments::SDK::Domain::CreatePaymentResponse.new_from_hash(hash['paymentResult'])
        end
      end
    end
  end
end
