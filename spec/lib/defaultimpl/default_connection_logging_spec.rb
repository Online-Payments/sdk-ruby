require 'spec_helper'
require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/card_payment_method_specific_input'
require 'onlinepayments/sdk/domain/create_payment_request'
require 'onlinepayments/sdk/domain/customer'
require 'onlinepayments/sdk/domain/order'
require 'httpclient'

# define module first so we can include them
# contains validation methods for messages logged in the tests
module ValidationDict
  REQUEST_START = %r(Outgoing request \(requestId="([-a-zA-Z0-9]+)"\):)
  RESPONSE_START = %r(Incoming response \(requestId="([-a-zA-Z0-9]+)", \d+.\d* ms\):)
  GET_METHOD = %r(method:       "GET")
  POST_METHOD = %r(method:       "POST")
  DELETE_METHOD = %r(method:       "DELETE")
  STATUS_200 = %r(status-code:  "200")
  STATUS_201 = %r(status-code:  "201")
  STATUS_204 = %r(status-code:  "204")
  STATUS_400 = %r(status-code:  "400")
  STATUS_402 = %r(status-code:  "402")
  STATUS_404 = %r(status-code:  "404")
  STATUS_500 = %r(status-code:  "500")
  DATEHEADER = %r(Date='[^']+')
  META_INFO_HEADER = %r(X-GCS-ServerMetaInfo='[^']*')
  AUTHORIZATION_HEADER = %r(Authorization='\*\*\*')
  DUMMY_HEADER = %r(Dummy='none')
  DATA_JSON_HEADER = %r(Content-Type='application/json')
  DATA_JSON = %r(content-type: "application/json")
  UNICODE_BODY_NAME = %r(Zavéntem)

  def validate_request_headers(message)
    expect(message).to match(DATEHEADER)
    expect(message).to match(META_INFO_HEADER)
    expect(message).to match(AUTHORIZATION_HEADER)
  end

  def createPayment_failure_invalidCardNumber_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(POST_METHOD)
    expect(message).to match(%r(uri:          "/v2/1234/payments"))
    validate_request_headers(message)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    expect(message).to match(%r("cardPaymentMethodSpecificInput":)) # token match to validate that a body is in the message
    return id
  end

  def createPayment_failure_invalidCardNumber_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_400)
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("VALUE \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* OF FIELD CREDITCARDNUMBER DID NOT PASS THE LUHNCHECK"))
    return id
  end

  def createPayment_failure_rejected_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(POST_METHOD)
    expect(message).to match(%r(uri:          "/v2/1234/payments"))
    validate_request_headers(message)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("cardPaymentMethodSpecificInput":))
    return id
  end

  def createPayment_failure_rejected_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_402)
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("message": "Not authorised"))
    return id
  end

  def createPayment_unicode_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(POST_METHOD)
    expect(message).to match(%r(uri:          "/v2/1234/payments"))
    validate_request_headers(message)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("cardPaymentMethodSpecificInput":))
    return id
  end

  def createPayment_unicode_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_201)
    expect(message).to match(%r(Location='payment\.preprod\.online-payments\.com/v2/1234/payments/1_1'))
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(DATA_JSON)
    expect(message).to match(UNICODE_BODY_NAME)
    # token match to validate that a body is in the message
    return id
  end

  def createPayment_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(POST_METHOD)
    expect(message).to match(%r(uri:          "/v2/1234/payments"))
    validate_request_headers(message)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("cardPaymentMethodSpecificInput":))
    return id
  end

  def createPayment_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_201)
    expect(message).to match(%r(Location='payment\.preprod\.online-payments\.com/v2/1234/payments/1_1'))
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("cardNumber": "\*16"))
    return id
  end

  def deleteToken_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(DELETE_METHOD)
    expect(message).to match(%r(uri:          "/v2/1234/tokens/5678"))
    validate_request_headers(message)
    return id
  end

  def deleteToken_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_204)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    return id
  end

  def notFound_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_404)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(%r(Content-Type='text/html'))
    expect(message).to match(%r(content-type: "text/html"))
    expect(message).to match(%r(body:         "Not Found"))
    return id
  end

  def testConnection_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(GET_METHOD)
    expect(message).to match(%r(uri:          "/v2/1234/services/testconnection"))
    validate_request_headers(message)
    return id
  end

  def testConnection_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_200)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("result": "OK"))
    return id
  end

  def unknownServerError_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1 # capture id from the regular expression above
    expect(message).to match(STATUS_500)
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATEHEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("message": "UNKNOWN_SERVER_ERROR"))
    return id
  end
end

# -----test examples-----:

describe 'DefaultConnectionLogging' do

  include ValidationDict

  let(:logger) { TestLogger.new }
  base_headers = { 'dummy' => 'none', 'Date' => 'Mon, 1 Jan 2000 00:00:00 GMT' }
  resource_prefix = 'spec/fixtures/resources/defaultimpl/'

  # tests testconnection
  it 'should be able to log a simple request' do
    response_body = IO.read("#{resource_prefix}testConnection.json")

    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_return(status: 200, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'application/json' }))

    CLIENT.enable_logging(logger)
    response = CLIENT.merchant('1234').services.test_connection

    expect(response).to_not be_nil
    expect(response.result).to eq('OK')

    validate_request_and_response(logger.entries[0], logger.entries[1], 'testConnection')
  end

  # tests delete token
  it 'can log DELETE requests' do
    stub_request(:delete, 'https://payment.preprod.online-payments.com/v2/1234/tokens/5678')
      .to_return(status: 204, headers: base_headers)

    CLIENT.enable_logging(logger)
    response = CLIENT.merchant('1234').tokens.delete_token('5678', nil)

    expect(response).to_not be_nil

    validate_request_and_response(logger.entries[0], logger.entries[1], 'deleteToken')
  end

  # tests create payment
  it 'can log POST responses' do
    response_body = IO.read("#{resource_prefix}createPayment.json")
    request = create_payment_request

    stub_request(:post, 'https://payment.preprod.online-payments.com/v2/1234/payments')
      .to_return(status: 201, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'application/json',
                                               'Location' => 'payment.preprod.online-payments.com/v2/1234/payments/1_1' }))

    CLIENT.enable_logging(logger)
    response = CLIENT.merchant('1234').payments.create_payment(request)

    expect(response).to_not be_nil
    expect(response.payment).to_not be_nil
    expect(response.payment.id).to_not be_nil

    validate_request_and_response(logger.entries[0], logger.entries[1], 'createPayment')
  end
  it 'can log POST responses with unicode body' do
    response_body = IO.read("#{resource_prefix}createPayment.unicode.json")
    request = create_payment_request

    stub_request(:post, 'https://payment.preprod.online-payments.com/v2/1234/payments')
      .to_return(status: 201, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'application/json',
                                               'Location' => 'payment.preprod.online-payments.com/v2/1234/payments/1_1' }))

    CLIENT.enable_logging(logger)
    response = CLIENT.merchant('1234').payments.create_payment(request)

    expect(response).to_not be_nil
    expect(response.payment).to_not be_nil
    expect(response.payment.id).to_not be_nil

    validate_request_and_response(logger.entries[0], logger.entries[1], 'createPayment_unicode')
  end

  # tests create payment with an invalid card number
  it 'can log error responses' do
    response_body = IO.read("#{resource_prefix}createPayment.failure.invalidCardNumber.json")
    request = create_payment_request

    stub_request(:post, 'https://payment.preprod.online-payments.com/v2/1234/payments')
      .to_return(status: 400, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'application/json' }))

    CLIENT.enable_logging(logger)
    expect { CLIENT.merchant('1234').payments.create_payment(request) }.to raise_error(OnlinePayments::SDK::ValidationException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'createPayment_failure_invalidCardNumber')
  end

  # tests create payment with a rejected payment
  it 'logs rejected payments' do
    response_body = IO.read("#{resource_prefix}createPayment.failure.rejected.json")
    request = create_payment_request

    stub_request(:post, 'https://payment.preprod.online-payments.com/v2/1234/payments')
      .to_return(status: 402, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'application/json' }))

    CLIENT.enable_logging(logger)
    expect { CLIENT.merchant('1234').payments.create_payment(request) }.to raise_error(OnlinePayments::SDK::DeclinedPaymentException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'createPayment_failure_rejected')
  end

  # tests the unknown server error response
  it 'logs general HTTP errors' do
    response_body = IO.read("#{resource_prefix}unknownServerError.json")

    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_return(status: 500, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'application/json' }))

    CLIENT.enable_logging(logger)
    expect { CLIENT.merchant('1234').services.test_connection }.to raise_error(OnlinePayments::SDK::PaymentPlatformException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'testConnection', 'unknownServerError')
  end

  # tests a not found response
  it 'logs non-json' do
    response_body = IO.read("#{resource_prefix}notFound.html")

    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_return(status: 404, body: response_body,
                 headers: base_headers.merge({ 'Content-Type' => 'text/html' }))

    CLIENT.enable_logging(logger)
    expect { CLIENT.merchant('1234').services.test_connection }.to raise_error(OnlinePayments::SDK::NotFoundException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'testConnection', 'notFound')
  end

  # tests a read timeout
  it 'logs timeouts' do
    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_raise(HTTPClient::ReceiveTimeoutError)

    CLIENT.enable_logging(logger)
    expect { CLIENT.merchant('1234').services.test_connection }.to raise_error(OnlinePayments::SDK::CommunicationException)

    request = logger.entries[0]
    expect(request[0]).to_not be_nil
    expect(request[1]).to be_nil, "Error logged that should not have been thrown:/n#{request[1]}"

    response = logger.entries[1]
    expect(response[0]).to_not be_nil
    expect(response[1]).to_not be_nil, 'A timeout error should have been logged'
    expect(response[1]).to be_a(HTTPClient::TimeoutError)

    validate_request_and_error(logger.entries[0], logger.entries[1], 'testConnection')
  end

  it 'can log requests individually' do
    response_body = IO.read("#{resource_prefix}testConnection.json")

    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_return { |request| CLIENT.disable_logging
      { body: response_body, status: 200, headers: base_headers.merge({ 'Content-type' => 'application/json' }) } }

    CLIENT.enable_logging(logger)
    response = CLIENT.merchant('1234').services.test_connection

    expect(response.result).to eq('OK')

    request = logger.entries[0]
    expect(request[0]).to_not be_nil
    expect(request[1]).to be_nil, "Error logged that should not have been thrown:/n#{request[1]}"

    validate_request(logger.entries[0], 'testConnection')
  end

  it 'can log responses individually' do
    response_body = IO.read("#{resource_prefix}testConnection.json")

    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_return { |request| CLIENT.enable_logging(logger)
      { body: response_body, status: 200, headers: base_headers.merge({ 'Content-type' => 'application/json' }) } }

    id_key = SecureRandom.uuid
    context = OnlinePayments::SDK::CallContext.new(id_key)
    response = CLIENT.merchant('1234').services.test_connection(context)

    expect(response.result).to eq('OK')

    response = logger.entries[0]
    expect(response[0]).to_not be_nil
    expect(response[1]).to be_nil, "Error logged that should not have been thrown:/n#{response[1]}"

    validate_response(logger.entries[0], 'testConnection')
  end

  it 'can log errors individually' do
    stub_request(:get, 'https://payment.preprod.online-payments.com/v2/1234/services/testconnection')
      .to_return { |request| CLIENT.enable_logging(logger)
      raise HTTPClient::ReceiveTimeoutError }

    id_key = SecureRandom.uuid
    context = OnlinePayments::SDK::CallContext.new(id_key)
    expect { CLIENT.merchant('1234').services.test_connection(context) }.to raise_error(OnlinePayments::SDK::CommunicationException)

    response = logger.entries[0]
    expect(response[0]).to_not be_nil
    expect(response[1]).to_not be_nil, 'A timeout error should have been logged'
    expect(response[1]).to be_a(HTTPClient::TimeoutError)

    validate_error(logger.entries[0])
  end
end

# Asserts that the request and response contain messages and no errors.
# Asserts that the request and response messages match the format
# in request_resource_prefix.request and response_resource_prefix.response respectively.
# If response_resource_prefix is not given it is assumed to be the same as the request_resource_prefix.
def validate_request_and_response(request, response,
                                  request_resource_prefix, response_resource_prefix = nil)
  # for request and response, check that the message exists in the logs and there is no error logged
  expect(request[0]).to_not be_nil
  expect(request[1]).to be_nil, "Error logged that should not have been thrown:/n#{request[1]}"

  expect(response[0]).to_not be_nil
  expect(response[1]).to be_nil, "Error logged that should not have been thrown:/n#{response[1]}"

  response_resource_prefix ||= request_resource_prefix
  request_id = validate_request(request, request_resource_prefix)
  fail if request_id.nil? # Request_id was not captured
  validate_response(response, response_resource_prefix, request_id)
end

# Asserts that the request message matches the request format in _resource_prefix.request_
# and that the request and error id are the same.
# Resource prefix is the location of the request resource, which will be appended with _.request_ to get the file location.
def validate_request_and_error(request, response_error, resource_prefix)
  request_id = validate_request(request, resource_prefix)
  validate_error(response_error, request_id)
end

# Asserts that the request message matches the request format in _resource_prefix.request_.
# Resource prefix is the location of the request resource, which will be appended with _.request_ to get the file location.
# Returns the request_id found in the request so it can be matched with a possible response or error
def validate_request(request, request_resource_prefix)
  method = ("#{request_resource_prefix}_request").to_sym
  return send(method, request[0])
end

# Asserts that the response message matches the response format in _resource_prefix.response_.
# Resource prefix is the location of the response resource, which will be appended with _.response_ to get the file location.
# If the parameter _request_id_ is given, it will be matched with the _request_id_ found in the response_message
def validate_response(response, response_resource_prefix, request_id = nil)
  method = ("#{response_resource_prefix}_response").to_sym
  response_id = send(method, response[0])
  expect(response_id).to eq(request_id) unless request_id.nil?
end

# Validates that the error message contains a requestId
# If a request_id is provided, it is matched against the error_id found in the error
def validate_error(error, request_id = nil)
  error_pattern_string = %r(Error occurred for outgoing request \(requestId='(?<error_id>[-a-zA-Z0-9]+)', \d+.\d* ms\))
  expect(error[0]).to match(error_pattern_string)
  error[0] =~ error_pattern_string # match to capture id
  error_id = $1
  expect(error_id).to eq(request_id) unless request_id.nil?
end

class TestLogger < OnlinePayments::SDK::Logging::CommunicatorLogger

  attr_accessor :entries

  def initialize
    @entries = []
  end

  def log(message, thrown = nil)
    @entries << [message, thrown]
  end
end

def create_payment_request
  amount_of_money = OnlinePayments::SDK::Domain::AmountOfMoney.new
  amount_of_money.amount = 2345
  amount_of_money.currency_code = 'EUR'
  customer = OnlinePayments::SDK::Domain::Customer.new
  billing_address = OnlinePayments::SDK::Domain::Address.new
  billing_address.country_code = 'BE'
  customer.billing_address = billing_address
  order = OnlinePayments::SDK::Domain::Order.new
  order.customer = customer
  card = OnlinePayments::SDK::Domain::Card.new
  card.cvv = '123'
  card.card_number = '4567350000427977'
  card.expiry_date = '1230'
  card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInput.new
  card_payment_method_specific_input.card = card
  card_payment_method_specific_input.payment_product_id = 1
  body = OnlinePayments::SDK::Domain::CreatePaymentRequest.new
  body.card_payment_method_specific_input = card_payment_method_specific_input
  body
end
