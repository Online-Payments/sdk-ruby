require 'spec_helper'
require 'httpclient'

# define module first so we can include them
# contains validation methods for messages logged in the tests
module ValidationDict
  REQUEST_START = %r(Outgoing request \(requestId='([-a-zA-Z0-9]+)'\):)
  RESPONSE_START = %r(Incoming response \(requestId='([-a-zA-Z0-9]+)', \d+.\d* ms\):)
  GET_METHOD = %r(method:       'GET')
  POST_METHOD = %r(method:       'POST')
  DELETE_METHOD = %r(method:       'DELETE')
  STATUS_200 = %r(status-code:  '200')
  STATUS_201 = %r(status-code:  '201')
  STATUS_204 = %r(status-code:  '204')
  STATUS_400 = %r(status-code:  '400')
  STATUS_402 = %r(status-code:  '402')
  STATUS_404 = %r(status-code:  '404')
  STATUS_500 = %r(status-code:  '500')
  DATE_HEADER = %r(Date="[^"]+")
  META_INFO_HEADER = %r(X-GCS-ServerMetaInfo="[^"]*")
  AUTHORIZATION_HEADER = %r(Authorization="\*\*\*\*\*\*\*\*"[^']*')
  DUMMY_HEADER = %r(Dummy="none")
  DATA_JSON_HEADER = %r(Content-Type="application/json")
  DATA_JSON = %r(content-type: 'application/json')
  UNICODE_BODY_NAME= %r(Schröder)

  def validate_request_headers(message)
    expect(message).to match(DATE_HEADER)
    expect(message).to match(META_INFO_HEADER)
    expect(message).to match(AUTHORIZATION_HEADER)
  end

  def getWithQueryParams_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(GET_METHOD)
    expect(message).to match(%r(uri:          '/v1/get\?source=EUR&target=USD&amount=1000'))
    validate_request_headers(message)
    id
  end

  def getWithQueryParams_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_200)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATE_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(%r(content-type: 'application/json'))
    # token match to validate that a body is in the message
    expect(message).to match(%r("convertedAmount" : 4547504))
    id
  end

  def postWithBadRequestResponse_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(POST_METHOD)
    expect(message).to match(%r(uri:          '/v1/bad-request'))
    validate_request_headers(message)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    expect(message).to match(%r("card":))  # token match to validate that a body is in the message
    id
  end

  def postWithBadRequestResponse_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_400)
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATE_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("VALUE \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* OF FIELD CREDITCARDNUMBER DID NOT PASS THE LUHNCHECK"))
    id
  end

  def postWithCreatedResponse_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(POST_METHOD)
    expect(message).to match(%r(uri:          '/v1/created'))
    validate_request_headers(message)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("card":))
    id
  end

  def postWithCreatedResponse_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_201)
    expect(message).to match(%r(Location="payment\.preprod\.online-payments\.com/v1/created/000000123410000595980000100001"))
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATE_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("id": "000000123410000595980000100001"))
    id
  end

  def deleteWithVoidResponse_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(DELETE_METHOD)
    expect(message).to match(%r(uri:          '/v1/void'))
    validate_request_headers(message)
    id
  end

  def deleteWithVoidResponse_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_204)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATE_HEADER)
    id
  end

  def notFound_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_404)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATE_HEADER)
    expect(message).to match(%r(Content-Type="text/html"))
    expect(message).to match(%r(content-type: 'text/html'))
    expect(message).to match(%r(body:         'Not Found'))
    id
  end

  def getWithoutQueryParams_request(message)
    expect(message).to match(REQUEST_START)
    message =~ REQUEST_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(GET_METHOD)
    expect(message).to match(%r(uri:          '/v1/get'))
    validate_request_headers(message)
    id
  end

  def getWithoutQueryParams_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_200)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATE_HEADER)
    expect(message).to match(DATA_JSON_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("result": "OK"))
    id
  end

  def unknownServerError_response(message)
    expect(message).to match(RESPONSE_START)
    message =~ RESPONSE_START
    id = $1  # capture id from the regular expression above
    expect(message).to match(STATUS_500)
    expect(message).to match(DATA_JSON_HEADER)
    # expect(message).to match(DUMMY_HEADER)
    expect(message).to match(DATE_HEADER)
    expect(message).to match(DATA_JSON)
    # token match to validate that a body is in the message
    expect(message).to match(%r("message": "UNKNOWN_SERVER_ERROR"))
    id
  end
end

class TestParamRequest < OnlinePayments::SDK::Communication::ParamRequest
  def initialize(params)
    @params = params
  end

  def to_request_parameters
    @params
  end
end

class TestObject < OnlinePayments::SDK::Domain::DataObject
  attr_accessor :content

  def to_h
    @content
  end

  def from_hash(hash)
    @content = hash
  end
end

# -----test examples-----:

describe 'DefaultConnectionLogging' do

  include ValidationDict

  let(:logger){TestLogger.new}
  base_headers = {'dummy' => 'none', 'Date' => 'Mon, 1 Jan 2000 00:00:00 GMT'}
  resource_prefix = 'spec/fixtures/resources/communication/'

  it 'should be able to log a simple request' do
    response_body = IO.read(resource_prefix + 'getWithoutQueryParams.json')

    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return(status: 200, body: response_body,
                   headers: base_headers.merge({'Content-Type' => 'application/json'}))

    COMMUNICATOR.enable_logging(logger)
    response = COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)

    expect(response).to_not be_nil
    expect(response.content).to_not be_nil
    expect(response.content['result']).to eq('OK')

    validate_request_and_response(logger.entries[0], logger.entries[1], 'getWithoutQueryParams')
  end

  it 'can log a GET request with parameters' do
    response_body = IO.read(resource_prefix + 'getWithQueryParams.json')

    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get?source=EUR&target=USD&amount=1000')
        .to_return(status: 200, body: response_body,
                   headers: base_headers.merge({'Content-Type' => 'application/json'}))

    query_params = TestParamRequest.new([
                                          RequestParam.new('source', 'EUR'),
                                          RequestParam.new('target', 'USD'),
                                          RequestParam.new('amount', '1000'),
                                        ])
    COMMUNICATOR.enable_logging(logger)

    response = COMMUNICATOR.get('/v1/get', nil, query_params, TestObject, nil)

    expect(response).to_not be_nil
    expect(response.content).to_not be_nil
    expect(response.content['convertedAmount']).to_not be_nil

    validate_request_and_response(logger.entries[0], logger.entries[1], 'getWithQueryParams')
  end

  it 'can log DELETE requests' do
    stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/void')
        .to_return(status: 204, headers: base_headers)

    COMMUNICATOR.enable_logging(logger)
    response = COMMUNICATOR.delete('/v1/void', nil, nil, nil, nil)

    expect(response).to_not be_nil

    validate_request_and_response(logger.entries[0], logger.entries[1], 'deleteWithVoidResponse')
  end

  it 'can log POST responses' do
    response_body = IO.read(resource_prefix + 'postWithCreatedResponse.json')
    request = create_test_request

    stub_request(:post, 'https://payment.preprod.online-payments.com/v1/created')
        .to_return(status: 201, body: response_body,
                   headers: base_headers.merge({'Content-Type' => 'application/json',
                                                'Location' => 'payment.preprod.online-payments.com/v1/created/000000123410000595980000100001'}))

    COMMUNICATOR.enable_logging(logger)
    response = COMMUNICATOR.post('/v1/created', nil, nil, request, TestObject, nil)

    expect(response).to_not be_nil
    expect(response.content).to_not be_nil
    expect(response.content['payment']).to_not be_nil
    expect(response.content['payment']['id']).to_not be_nil

    validate_request_and_response(logger.entries[0], logger.entries[1], 'postWithCreatedResponse')
  end

  it 'can log error responses' do
    response_body = IO.read(resource_prefix + 'postWithBadRequestResponse.json')
    request = create_test_request

    stub_request(:post, 'https://payment.preprod.online-payments.com/v1/bad-request')
        .to_return(status: 400, body: response_body,
                   headers: base_headers.merge({'Content-Type' => 'application/json'}))

    COMMUNICATOR.enable_logging(logger)
    expect{COMMUNICATOR.post('/v1/bad-request', nil, nil, request, TestObject, nil)}.to raise_error(OnlinePayments::SDK::Communication::ResponseException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'postWithBadRequestResponse')
  end

  it 'logs general HTTP errors' do
    response_body = IO.read(resource_prefix + 'unknownServerError.json')

    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return(status: 500, body: response_body,
                   headers: base_headers.merge({'Content-Type' => 'application/json'}))

    COMMUNICATOR.enable_logging(logger)
    expect{COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)}.to raise_error(OnlinePayments::SDK::Communication::ResponseException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'getWithoutQueryParams', 'unknownServerError')
  end

  it 'logs non-json' do
    response_body = IO.read(resource_prefix + 'notFound.html')

    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return(status: 404, body: response_body,
                   headers: base_headers.merge({'Content-Type' => 'text/html'}))

    COMMUNICATOR.enable_logging(logger)
    expect{COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)}.to raise_error(OnlinePayments::SDK::Communication::NotFoundException)

    validate_request_and_response(logger.entries[0], logger.entries[1], 'getWithoutQueryParams', 'notFound')
  end

  it 'logs timeouts' do
    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_raise(HTTPClient::ReceiveTimeoutError)

    COMMUNICATOR.enable_logging(logger)
    expect{COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)}.to raise_error(OnlinePayments::SDK::Communication::CommunicationException)

    request = logger.entries[0]
    expect(request[0]).to_not be_nil
    expect(request[1]).to be_nil, "Error logged that should not have been thrown:/n#{request[1]}"

    response = logger.entries[1]
    expect(response[0]).to_not be_nil
    expect(response[1]).to_not be_nil, 'A timeout error should have been logged'
    expect(response[1]).to be_a(HTTPClient::TimeoutError)

    validate_request_and_error(logger.entries[0], logger.entries[1], 'getWithoutQueryParams')
  end

  it 'can log requests individually' do
    response_body = IO.read(resource_prefix + 'getWithoutQueryParams.json')

    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return{ |request| COMMUNICATOR.disable_logging
                    {body: response_body, status: 200, headers: base_headers.merge({'Content-type' => 'application/json'})}}

    COMMUNICATOR.enable_logging(logger)
    response = COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)

    expect(response).to_not be_nil
    expect(response.content).to_not be_nil
    expect(response.content['result']).to eq('OK')

    request = logger.entries[0]
    expect(request[0]).to_not be_nil
    expect(request[1]).to be_nil, "Error logged that should not have been thrown:/n#{request[1]}"

    validate_request(logger.entries[0], 'getWithoutQueryParams')
  end

  it 'can log responses individually' do
    response_body = IO.read(resource_prefix + 'getWithoutQueryParams.json')

    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return{ |request| COMMUNICATOR.enable_logging(logger)
    {body: response_body, status: 200, headers: base_headers.merge({'Content-type' => 'application/json'})}}

    response = COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)

    expect(response).to_not be_nil
    expect(response.content).to_not be_nil
    expect(response.content['result']).to eq('OK')

    response = logger.entries[0]
    expect(response[0]).to_not be_nil
    expect(response[1]).to be_nil, "Error logged that should not have been thrown:/n#{response[1]}"

    validate_response(logger.entries[0], 'getWithoutQueryParams')
  end

  it 'can log errors individually' do
    stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return{ |request| COMMUNICATOR.enable_logging(logger)
    raise HTTPClient::ReceiveTimeoutError.new}

    expect{COMMUNICATOR.get('/v1/get', nil, nil, TestObject, nil)}.to raise_error(OnlinePayments::SDK::Communication::CommunicationException)

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
                                  request_resource_prefix, response_resource_prefix=nil)
  # for request and response, check that the message exists in the logs and there is no error logged
  expect(request[0]).to_not be_nil
  expect(request[1]).to be_nil, "Error logged that should not have been thrown:/n#{request[1]}"

  expect(response[0]).to_not be_nil
  expect(response[1]).to be_nil, "Error logged that should not have been thrown:/n#{response[1]}"

  response_resource_prefix ||= request_resource_prefix
  request_id = validate_request(request, request_resource_prefix)
  fail if request_id.nil?  # Request_id was not captured
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
  method = (request_resource_prefix + '_request').to_sym
  send(method, request[0])
end

# Asserts that the response message matches the response format in _resource_prefix.response_.
# Resource prefix is the location of the response resource, which will be appended with _.response_ to get the file location.
# If the parameter _request_id_ is given, it will be matched with the _request_id_ found in the response_message
def validate_response(response, response_resource_prefix, request_id=nil)
  method = (response_resource_prefix + '_response').to_sym
  response_id = send(method, response[0])
  expect(response_id).to eq(request_id) unless request_id.nil?
end

# Validates that the error message contains a requestId
# If a request_id is provided, it is matched against the error_id found in the error
def validate_error(error, request_id=nil)
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


def create_test_request
  object = TestObject.new
  object.content = {
    card: {
      cvv: '123',
      cardNumber: '1234567890123456',
      expiryDate: '1220',
    }
  }
  object
end
