require 'onlinepayments/sdk/domain/error_response'

module OnlinePayments::SDK

  # Base class of all Online Payments platform API resources.
  # Provides shared functionality to facilitate communication with the Online Payments platform.
  #
  # @attr_reader [OnlinePayments::SDK::Communicator] communicator Communicator instance that provides communication with the Online Payments platform.
  # @attr_reader [String] client_meta_info JSON string containing client info specific to the current client.
  class ApiResource

    # Creates a new ApiResource.
    #
    # @param arg              [OnlinePayments::SDK::ApiResource, OnlinePayments::SDK::Communicator] parent class or Communicator instance.
    #                         If a parent class is given its communicator will be used for communication.
    # @param path_context     [Hash, nil] hash that contains substitutions for generic locations in the URL path.
    #                         This hash will be used to instantiate a concrete URL used to access specific resources.
    #                         For example in the URL https://payment.preprod.online-payments.com/!{version}/!{merchantId}/payments
    #                         !{version} and !{merchantId} can be instantiated using the hash
    #                         !{'version' => 'v2', 'merchantId' => '1'}. The final URL in this case will be
    #                         https://payment.preprod.online-payments.com/v2/1/payments.
    # @param client_meta_info [String, nil] JSON string containing the meta data for the client.
    def initialize(arg, path_context = nil, client_meta_info = false)
      if client_meta_info == false
        raise ArgumentError, 'parent is required' unless arg

        @parent = arg
        @communicator = arg.communicator
        @client_meta_info = arg.client_meta_info
      else
        raise ArgumentError, 'communicator is required' unless arg

        @parent = nil
        @communicator = arg
        @client_meta_info = client_meta_info
      end
      @path_context = path_context
    end

    attr_reader :communicator
    attr_reader :client_meta_info

    protected

    # @return [Array<OnlinePayments::SDK::RequestHeader>, nil] the X-GCS-ClientMetaInfo header.
    def client_headers
      @client_meta_info ?
        [RequestHeader.new('X-GCS-ClientMetaInfo', @client_meta_info)] :
        nil
    end

    def instantiate_uri(uri, path_context = nil)
      uri = replace_all(uri, path_context) if path_context
      uri = replace_all(uri, @path_context)
      @parent ? @parent.instantiate_uri(uri) : uri
    end

    def create_exception(status_code, response_body, error_object, context)
      if error_object.nil?
        error_id = nil
        errors = []
      elsif error_object.is_a?(OnlinePayments::SDK::Domain::PaymentErrorResponse) && error_object.payment_result
        return DeclinedPaymentException.new(status_code, response_body, error_object)
      elsif error_object.is_a?(OnlinePayments::SDK::Domain::PayoutErrorResponse) && error_object.payout_result
        return DeclinedPayoutException.new(status_code, response_body, error_object)
      elsif error_object.is_a?(OnlinePayments::SDK::Domain::RefundErrorResponse) && error_object.refund_result
        return DeclinedRefundException.new(status_code, response_body, error_object)
      elsif error_object.is_a?(OnlinePayments::SDK::Domain::PaymentErrorResponse) ||
        error_object.is_a?(OnlinePayments::SDK::Domain::PayoutErrorResponse) ||
        error_object.is_a?(OnlinePayments::SDK::Domain::RefundErrorResponse) ||
        error_object.is_a?(OnlinePayments::SDK::Domain::ErrorResponse)
        error_id = error_object.error_id
        errors = error_object.errors
      else
        raise ArgumentError, "unsupported error object type: #{error_object.class.name}"
      end

      case status_code
      when 400
        return ValidationException.new(status_code, response_body, error_id, errors)
      when 403
        return AuthorizationException.new(status_code, response_body, error_id, errors)
      when 404, 410
        return ReferenceException.new(status_code, response_body, error_id, errors)
      when 409
        if is_idempotence_error(errors, context)
          idempotence_key = context.idempotence_key
          idempotence_request_timestamp = context.idempotence_request_timestamp
          return IdempotenceException.new(status_code, response_body, error_id,
                                          errors, idempotence_key,
                                          idempotence_request_timestamp)
        else
          return ReferenceException.new(status_code, response_body, error_id, errors)
        end
      when 500, 502, 503
        return PaymentPlatformException.new(status_code, response_body, error_id, errors)
      else
        return ApiException.new(status_code, response_body, error_id, errors)
      end
    end

    private

    def replace_all(uri, path_context)
      path_context&.each do |key, value|
        uri = uri.gsub("{#{key}}", value)
      end
      uri
    end

    def is_idempotence_error(errors, context)
      context&.idempotence_key && errors.length == 1 && errors[0].code == '1409'
    end
  end
end
