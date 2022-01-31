module OnlinePayments::SDK

  # This exception is thrown when a response from the payment platform indicates that an error occurred
  # on the payment platform while processing the request.
  # This corresponds to a HTTP status code of 500 or 502.
  class PaymentPlatformException < ApiException

    # Create a new PaymentPlatformException
    # @see ApiException#initialize
    def initialize(status_code, response_body, error_id, errors,
                   message = 'the Online Payments platform returned an error response')
      super(status_code, response_body, error_id, errors, message)
    end
  end
end
