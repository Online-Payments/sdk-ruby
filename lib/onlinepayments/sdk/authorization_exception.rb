module OnlinePayments::SDK

  # This exception is thrown when a request sent to the Online Payments platform is not correctly authenticated.
  # Corresponds to a HTTP status code of 403.
  # @see ApiException#initialize
  class AuthorizationException < ApiException

    def initialize(status_code, response_body, error_id, errors,
                   message = 'the Online Payments platform returned an authorization error response')
      super(status_code, response_body, error_id, errors, message)
    end
  end
end
