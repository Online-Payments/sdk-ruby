module OnlinePayments::SDK

  # Raised when the request sent to the Online Payments platform returned a HTTP response with status code 400.
  # This indicates the request received by the Online Payments platform was malformed.
  class ValidationException < ApiException

    # Create a new ValidationException
    # @see ApiException#initialize
    def initialize(status_code, response_body, error_id, errors,
                   message = 'the Online Payments platform returned an incorrect request error response')
      super(status_code, response_body, error_id, errors, message)
    end
  end
end
