#
# This file was automatically generated.
#
require_relative 'api_exception'
require_relative 'authorization_exception'
require_relative 'declined_payment_exception'
require_relative 'declined_payout_exception'
require_relative 'declined_refund_exception'
require_relative 'idempotence_exception'
require_relative 'platform_exception'
require_relative 'reference_exception'
require_relative 'validation_exception'

require 'onlinepayments/sdk/domain/error_response'
require 'onlinepayments/sdk/domain/payment_error_response'
require 'onlinepayments/sdk/domain/payout_error_response'
require 'onlinepayments/sdk/domain/refund_error_response'

module OnlinePayments
  module SDK
    def self.create_exception(status_code, response_body, error_object, context)
      if error_object.is_a?(OnlinePayments::SDK::Domain::PaymentErrorResponse)
        return DeclinedPaymentException.new(status_code, response_body, error_object) unless error_object.payment_result.nil?
        return create_exception_from_response_fields(status_code, response_body, error_object.error_id, error_object.errors, context)
      end
      if error_object.is_a?(OnlinePayments::SDK::Domain::PayoutErrorResponse)
        return DeclinedPayoutException.new(status_code, response_body, error_object) unless error_object.payout_result.nil?
        return create_exception_from_response_fields(status_code, response_body, error_object.error_id, error_object.errors, context)
      end
      if error_object.is_a?(OnlinePayments::SDK::Domain::RefundErrorResponse)
        return DeclinedRefundException.new(status_code, response_body, error_object) unless error_object.refund_result.nil?
        return create_exception_from_response_fields(status_code, response_body, error_object.error_id, error_object.errors, context)
      end
      raise ArgumentError.new("unsupported error object type: " + error_object.class.name) unless error_object.is_a?(OnlinePayments::SDK::Domain::ErrorResponse)
      create_exception_from_response_fields(status_code, response_body, error_object.error_id, error_object.errors, context)
    end

    private

    def self.create_exception_from_response_fields(status_code, response_body, error_id, errors, context)
      case status_code
        when 400
          return ValidationException.new(status_code, response_body, error_id, errors)
        when 403
          return AuthorizationException.new(status_code, response_body, error_id, errors)
        when 404
          return ReferenceException.new(status_code, response_body, error_id, errors)
        when 409
          if is_idempotence_error(errors, context)
            idempotence_key = context.idempotence_key
            idempotence_request_timestamp = context.idempotence_request_timestamp
            return IdempotenceException.new(status_code, response_body, error_id, errors,
                                            idempotence_key, idempotence_request_timestamp)
          else
            return ReferenceException.new(status_code, response_body, error_id, errors)
          end
        when 410
          return ReferenceException.new(status_code, response_body, error_id, errors)
        when 500
          return PlatformException.new(status_code, response_body, error_id, errors)
        when 502
          return PlatformException.new(status_code, response_body, error_id, errors)
        when 503
          return PlatformException.new(status_code, response_body, error_id, errors)
        else
          return ApiException.new(status_code, response_body, error_id, errors)
      end
    end

    def self.is_idempotence_error(errors, context)
      !context&.idempotence_key.nil? &&
        errors&.length == 1 &&
            errors[0]&.error_code == '1409'
    end
  end
end
