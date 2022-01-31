module OnlinePayments::SDK

  # Base class for many exceptions raised by the SDK.
  # It is raised when an error response is received from the Online Payments platform.
  # It contains data about the returned response.
  #
  # @attr_reader [Integer] status_code   HTTP status code of the returned response.
  # @attr_reader [String]  response_body Message body of the returned response.
  # @attr_reader [String]  error_id      An error id corresponding to the error that occurred, if available.
  # @attr_reader [Array<OnlinePayments::SDK::Domain::APIError>] errors A list of errors received from the Online Payments platform;
  #              may be empty but never _nil_
  class ApiException < RuntimeError

    # Creates a new ApiException that reports an error response from the Online Payments platform.
    #
    # @param status_code   (Integer) HTTP status code the response
    # @param response_body (String) HTTP response body
    # @param error_id      (String) error id of the error, may be _nil_
    # @param errors        (Array<OnlinePayments::SDK::Domain::APIError>) a list of errors that occurred, may be empty
    # @param message       (String) error message to include
    def initialize(status_code, response_body, error_id, errors,
                   message = 'the Online Payments platform returned an error response')
      super(message)
      @status_code = status_code
      @response_body = response_body
      @error_id = error_id
      @errors = errors || [].freeze
    end

    attr_reader :status_code
    attr_reader :response_body
    attr_reader :error_id
    attr_reader :errors

    def to_s
      str = super.to_s
      str += "; status_code=#{@status_code}" if @status_code.positive?
      str += "; response_body='#{@response_body}'" if @response_body&.length&.positive?
      str.to_s
    end
  end
end
