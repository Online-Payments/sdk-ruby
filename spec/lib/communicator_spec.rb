require 'spec_helper'
require 'json'

Communicator ||= OnlinePayments::SDK::Communicator
DefaultMarshaller ||= OnlinePayments::SDK::JSON::DefaultMarshaller
RequestParam ||= OnlinePayments::SDK::Communication::RequestParam
MetadataProvider ||= OnlinePayments::SDK::Communication::MetadataProvider
CallContext ||= OnlinePayments::SDK::CallContext
ResponseHeader ||= OnlinePayments::SDK::Communication::ResponseHeader
ResponseException ||= OnlinePayments::SDK::Communication::ResponseException
CommunicationException ||= OnlinePayments::SDK::Communication::CommunicationException
NotFoundException ||= OnlinePayments::SDK::Communication::NotFoundException
MultipartFormDataObject  ||= OnlinePayments::SDK::Communication::MultipartFormDataObject
MultipartFormDataRequest ||= OnlinePayments::SDK::Communication::MultipartFormDataRequest

class CommunicatorSpecParamRequest < OnlinePayments::SDK::Communication::ParamRequest
  def initialize(params)
    @params = params
  end

  def to_request_parameters
    @params
  end
end

class CommunicatorSpecObject < OnlinePayments::SDK::Domain::DataObject
  attr_accessor :content

  def initialize(content = nil)
    @content = content
  end

  def to_h
    @content
  end

  def from_hash(hash)
    @content = hash
  end
end

describe Communicator do
  let(:connection) { double('connection', close: nil) }
  let(:metadata_provider) { MetadataProvider.new('OnlinePayments') }
  let(:communicator) do
    Communicator.new('https://payment.preprod.online-payments.com', connection, MockAuthenticator.new,
                     metadata_provider, DefaultMarshaller.instance)
  end
  let(:sdk_communicator) { COMMUNICATOR }

  context 'to_absolute_uri()' do
    it 'accepts a uri with or without a leading slash' do
      uri1 = communicator.send(:to_absolute_uri, 'v1/merchant/20000/convertamount', [])
      uri2 = communicator.send(:to_absolute_uri, '/v1/merchant/20000/convertamount', [])

      expect(uri1.to_s).to eq('https://payment.preprod.online-payments.com:443/v1/merchant/20000/convertamount')
      expect(uri2.to_s).to eq('https://payment.preprod.online-payments.com:443/v1/merchant/20000/convertamount')
    end

    it 'adds request parameters to the uri' do
      request_params = [RequestParam.new('amount', '123'), RequestParam.new('source', 'USD'),
                        RequestParam.new('target', 'EUR'), RequestParam.new('dummy', 'é&%=')]

      uri = communicator.send(:to_absolute_uri, 'v1/merchant/20000/convertamount', request_params)

      expect(uri.to_s).to eq('https://payment.preprod.online-payments.com:443/v1/merchant/20000/convertamount' \
                             '?amount=123&source=USD&target=EUR&dummy=%C3%A9%26%25%3D')
    end
  end

  context 'request execution' do
    it 'executes GET requests' do
      stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      response = sdk_communicator.get('/v1/get', nil, nil, CommunicatorSpecObject, nil)

      expect(response.content).to eq('result' => 'OK')
    end

    it 'executes POST requests' do
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post')
        .with do |webmock_request|
          JSON.parse(webmock_request.body) == { 'request' => 'body' } &&
            webmock_request.headers['Content-Type'] == 'application/json'
        end
        .to_return(status: 200, body: '{"result":"created"}', headers: { 'Content-Type' => 'application/json' })

      response = sdk_communicator.post('/v1/post', nil, nil, request, CommunicatorSpecObject, nil)

      expect(response.content).to eq('result' => 'created')
    end

    it 'sends a nil POST body as an empty request payload with text/plain content type' do
      stub = stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-empty')
        .with do |webmock_request|
          webmock_request.body.to_s.empty? && webmock_request.headers['Content-Type'] == 'text/plain'
        end
        .to_return(status: 200, body: '{"result":"created"}', headers: { 'Content-Type' => 'application/json' })

      response = sdk_communicator.post('/v1/post-empty', nil, nil, nil, CommunicatorSpecObject, nil)

      expect(response.content).to eq('result' => 'created')
      expect(stub).to have_been_requested
    end

    it 'executes PUT requests' do
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put')
        .with do |webmock_request|
          JSON.parse(webmock_request.body) == { 'request' => 'body' } &&
            webmock_request.headers['Content-Type'] == 'application/json'
        end
        .to_return(status: 200, body: '{"result":"updated"}', headers: { 'Content-Type' => 'application/json' })

      response = sdk_communicator.put('/v1/put', nil, nil, request, CommunicatorSpecObject, nil)

      expect(response.content).to eq('result' => 'updated')
    end

    it 'sends a nil PUT body as an empty request payload with text/plain content type' do
      stub = stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put-empty')
        .with do |webmock_request|
          webmock_request.body.to_s.empty? && webmock_request.headers['Content-Type'] == 'text/plain'
        end
        .to_return(status: 200, body: '{"result":"updated"}', headers: { 'Content-Type' => 'application/json' })

      response = sdk_communicator.put('/v1/put-empty', nil, nil, nil, CommunicatorSpecObject, nil)

      expect(response.content).to eq('result' => 'updated')
      expect(stub).to have_been_requested
    end

    it 'executes DELETE requests' do
      stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete')
        .to_return(status: 200, body: '{"result":"deleted"}', headers: { 'Content-Type' => 'application/json' })

      response = sdk_communicator.delete('/v1/delete', nil, nil, CommunicatorSpecObject, nil)

      expect(response.content).to eq('result' => 'deleted')
    end
  end

  context 'multipart form data' do
    let(:captured_headers) { [] }
    let(:capturing_connection) do
      conn = double('connection', close: nil)
      allow(conn).to receive(:post) do |_uri, headers, _body, &block|
        captured_headers.replace(headers)
        block.call(200, [ResponseHeader.new('Content-Type', 'application/json')], StringIO.new('{}'))
      end
      conn
    end
    let(:multipart_communicator) do
      Communicator.new('https://payment.preprod.online-payments.com', capturing_connection,
                       MockAuthenticator.new, metadata_provider, DefaultMarshaller.instance)
    end

    it 'sets Content-Type from MultipartFormDataObject when used as POST body' do
      multipart = MultipartFormDataObject.new
      multipart.add_value('field1', 'value1')

      multipart_communicator.post('/v1/multipart', nil, nil, multipart, CommunicatorSpecObject, nil)

      content_type_header = captured_headers.find { |h| h.name.casecmp('Content-Type').zero? }
      expect(content_type_header).not_to be_nil
      expect(content_type_header.value).to start_with('multipart/form-data; boundary=')
      expect(content_type_header.value).to eq(multipart.content_type)
    end

    it 'converts MultipartFormDataRequest to MultipartFormDataObject and sets Content-Type for POST' do
      inner_multipart = MultipartFormDataObject.new
      inner_multipart.add_value('key', 'val')

      request = Class.new(MultipartFormDataRequest) do
        define_method(:initialize) { |mp| @mp = mp }
        define_method(:to_multipart_form_data_object) { @mp }
      end.new(inner_multipart)

      multipart_communicator.post('/v1/multipart-req', nil, nil, request, CommunicatorSpecObject, nil)

      content_type_header = captured_headers.find { |h| h.name.casecmp('Content-Type').zero? }
      expect(content_type_header).not_to be_nil
      expect(content_type_header.value).to start_with('multipart/form-data; boundary=')
      expect(content_type_header.value).to eq(inner_multipart.content_type)
    end
  end

  context 'gzip encoding' do
    it 'adds Content-Encoding: gzip header when context.gzip is true' do
      stub = stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-gzip')
        .with { |req| req.headers['Content-Encoding'] == 'gzip' }
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      context = CallContext.new(nil)
      context.gzip = true
      request = CommunicatorSpecObject.new('request' => 'body')

      sdk_communicator.post('/v1/post-gzip', nil, nil, request, CommunicatorSpecObject, context)

      expect(stub).to have_been_requested
    end

    it 'does not add Content-Encoding: gzip header when context.gzip is false' do
      stub = stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-no-gzip')
        .with { |req| !req.headers.key?('Content-Encoding') }
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      context = CallContext.new(nil)
      context.gzip = false
      request = CommunicatorSpecObject.new('request' => 'body')

      sdk_communicator.post('/v1/post-no-gzip', nil, nil, request, CommunicatorSpecObject, context)

      expect(stub).to have_been_requested
    end

    it 'does not add Content-Encoding: gzip header when context is nil' do
      stub = stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-nil-context')
        .with { |req| !req.headers.key?('Content-Encoding') }
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      request = CommunicatorSpecObject.new('request' => 'body')

      sdk_communicator.post('/v1/post-nil-context', nil, nil, request, CommunicatorSpecObject, nil)

      expect(stub).to have_been_requested
    end
  end

  context 'binary response handlers' do
    it 'yields GET response bodies to binary handlers' do
      body = "GET\x00BINARY".b
      stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get-binary')
        .to_return(status: 200, body: body, headers: { 'Content-Type' => 'application/octet-stream' })

      response_headers = nil
      response_body = nil

      sdk_communicator.get_with_binary_response('/v1/get-binary', nil, nil, nil) do |headers, content|
        response_headers = headers
        response_body = content.read
      end

      expect(response_body).to eq(body)
      expect(ResponseHeader.get_header_value(response_headers, 'Content-Type')).to eq('application/octet-stream')
    end

    it 'yields POST response bodies to binary handlers' do
      body = 'POST-BINARY'.b
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-binary')
        .to_return(status: 200, body: body, headers: { 'Content-Type' => 'application/octet-stream' })

      response_body = nil

      sdk_communicator.post_with_binary_response('/v1/post-binary', nil, nil, request, nil) do |_headers, content|
        response_body = content.read
      end

      expect(response_body).to eq(body)
    end

    it 'yields PUT response bodies to binary handlers' do
      body = 'PUT-BINARY'.b
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put-binary')
        .to_return(status: 200, body: body, headers: { 'Content-Type' => 'application/octet-stream' })

      response_body = nil

      sdk_communicator.put_with_binary_response('/v1/put-binary', nil, nil, request, nil) do |_headers, content|
        response_body = content.read
      end

      expect(response_body).to eq(body)
    end

    it 'yields DELETE response bodies to binary handlers' do
      body = 'DELETE-BINARY'.b
      stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-binary')
        .to_return(status: 200, body: body, headers: { 'Content-Type' => 'application/octet-stream' })

      response_body = nil

      sdk_communicator.delete_with_binary_response('/v1/delete-binary', nil, nil, nil) do |_headers, content|
        response_body = content.read
      end

      expect(response_body).to eq(body)
    end
  end

  context 'error handling' do
    it 'raises ResponseException for JSON POST error responses' do
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-error')
        .to_return(status: 400, body: '{"error":"bad request"}', headers: { 'Content-Type' => 'application/json' })

      expect do
        sdk_communicator.post('/v1/post-error', nil, nil, request, CommunicatorSpecObject, nil)
      end.to raise_error(ResponseException) { |error| expect(error.status_code).to eq(400) }
    end

    it 'raises ResponseException for JSON PUT error responses' do
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put-error')
        .to_return(status: 400, body: '{"error":"bad request"}', headers: { 'Content-Type' => 'application/json' })

      expect do
        sdk_communicator.put('/v1/put-error', nil, nil, request, CommunicatorSpecObject, nil)
      end.to raise_error(ResponseException) { |error| expect(error.status_code).to eq(400) }
    end

    it 'raises ResponseException for JSON DELETE error responses' do
      stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-error')
        .to_return(status: 400, body: '{"error":"bad request"}', headers: { 'Content-Type' => 'application/json' })

      expect do
        sdk_communicator.delete('/v1/delete-error', nil, nil, CommunicatorSpecObject, nil)
      end.to raise_error(ResponseException) { |error| expect(error.status_code).to eq(400) }
    end

    it 'raises NotFoundException for non-JSON GET 404 responses' do
      stub_request(:get, 'https://payment.preprod.online-payments.com/does/not/exist')
        .to_return(status: 404, body: 'Not found', headers: { 'Content-Type' => 'text/html' })

      expect do
        sdk_communicator.get('does/not/exist', nil, nil, CommunicatorSpecObject, nil)
      end.to raise_error(NotFoundException, /invalid path: does\/not\/exist/)
    end

    it 'raises CommunicationException for non-JSON GET 500 responses' do
      stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get-error')
        .to_return(status: 500, body: 'server error', headers: { 'Content-Type' => 'text/html' })

      expect do
        sdk_communicator.get('/v1/get-error', nil, nil, CommunicatorSpecObject, nil)
      end.to raise_error(CommunicationException) { |error| expect(error.cause.status_code).to eq(500) }
    end
  end

  context 'idempotence' do
    let(:response_headers) do
      {
        'Content-Type' => 'application/json',
        'X-GCS-Idempotence-Request-Timestamp' => '123456789',
        'IdempotencyResponseDatetime' => '2026-04-02T10:15:30Z'
      }
    end

    it 'adds the idempotence header for GET requests when a call context is provided and omits it otherwise' do
      stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })
      stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get-no-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      sdk_communicator.get('/v1/get-idempotence', nil, nil, CommunicatorSpecObject, CallContext.new('test-idempotence-key'))
      sdk_communicator.get('/v1/get-no-idempotence', nil, nil, CommunicatorSpecObject, nil)

      expect(a_request(:get, 'https://payment.preprod.online-payments.com/v1/get-idempotence')
        .with { |request| request.headers.any? { |key, value| key.casecmp('X-GCS-Idempotence-Key').zero? && value == 'test-idempotence-key' } }).to have_been_made
      expect(a_request(:get, 'https://payment.preprod.online-payments.com/v1/get-no-idempotence')
        .with { |request| request.headers.keys.none? { |key| key.casecmp('X-GCS-Idempotence-Key').zero? } }).to have_been_made
    end

    it 'adds the idempotence header for POST requests when a call context is provided and omits it otherwise' do
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })
      stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-no-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      sdk_communicator.post('/v1/post-idempotence', nil, nil, request, CommunicatorSpecObject, CallContext.new('test-idempotence-key'))
      sdk_communicator.post('/v1/post-no-idempotence', nil, nil, request, CommunicatorSpecObject, nil)

      expect(a_request(:post, 'https://payment.preprod.online-payments.com/v1/post-idempotence')
        .with { |request| request.headers.any? { |key, value| key.casecmp('X-GCS-Idempotence-Key').zero? && value == 'test-idempotence-key' } }).to have_been_made
      expect(a_request(:post, 'https://payment.preprod.online-payments.com/v1/post-no-idempotence')
        .with { |webmock_request| webmock_request.headers.keys.none? { |key| key.casecmp('X-GCS-Idempotence-Key').zero? } }).to have_been_made
    end

    it 'adds the idempotence header for PUT requests when a call context is provided and omits it otherwise' do
      request = CommunicatorSpecObject.new('request' => 'body')
      stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })
      stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put-no-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      sdk_communicator.put('/v1/put-idempotence', nil, nil, request, CommunicatorSpecObject, CallContext.new('test-idempotence-key'))
      sdk_communicator.put('/v1/put-no-idempotence', nil, nil, request, CommunicatorSpecObject, nil)

      expect(a_request(:put, 'https://payment.preprod.online-payments.com/v1/put-idempotence')
        .with { |request| request.headers.any? { |key, value| key.casecmp('X-GCS-Idempotence-Key').zero? && value == 'test-idempotence-key' } }).to have_been_made
      expect(a_request(:put, 'https://payment.preprod.online-payments.com/v1/put-no-idempotence')
        .with { |webmock_request| webmock_request.headers.keys.none? { |key| key.casecmp('X-GCS-Idempotence-Key').zero? } }).to have_been_made
    end

    it 'adds the idempotence header for DELETE requests when a call context is provided and omits it otherwise' do
      stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })
      stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-no-idempotence')
        .to_return(status: 200, body: '{"result":"OK"}', headers: { 'Content-Type' => 'application/json' })

      sdk_communicator.delete('/v1/delete-idempotence', nil, nil, CommunicatorSpecObject, CallContext.new('test-idempotence-key'))
      sdk_communicator.delete('/v1/delete-no-idempotence', nil, nil, CommunicatorSpecObject, nil)

      expect(a_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-idempotence')
        .with { |request| request.headers.any? { |key, value| key.casecmp('X-GCS-Idempotence-Key').zero? && value == 'test-idempotence-key' } }).to have_been_made
      expect(a_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-no-idempotence')
        .with { |request| request.headers.keys.none? { |key| key.casecmp('X-GCS-Idempotence-Key').zero? } }).to have_been_made
    end

    it 'updates the call context from GET response headers' do
      stub_request(:get, 'https://payment.preprod.online-payments.com/v1/get-context')
        .to_return(status: 200, body: '{"result":"OK"}', headers: response_headers)
      context = CallContext.new('test-idempotence-key')

      sdk_communicator.get('/v1/get-context', nil, nil, CommunicatorSpecObject, context)

      expect(context.idempotence_key).to eq('test-idempotence-key')
      expect(context.idempotence_request_timestamp).to eq('123456789')
      expect(context.idempotence_response_date_time).to eq(DateTime.parse('2026-04-02T10:15:30Z'))
    end

    it 'updates the call context from POST response headers' do
      stub_request(:post, 'https://payment.preprod.online-payments.com/v1/post-context')
        .to_return(status: 200, body: '{"result":"OK"}', headers: response_headers)
      context = CallContext.new('test-idempotence-key')

      sdk_communicator.post('/v1/post-context', nil, nil, CommunicatorSpecObject.new('request' => 'body'), CommunicatorSpecObject, context)

      expect(context.idempotence_key).to eq('test-idempotence-key')
      expect(context.idempotence_request_timestamp).to eq('123456789')
      expect(context.idempotence_response_date_time).to eq(DateTime.parse('2026-04-02T10:15:30Z'))
    end

    it 'updates the call context from PUT response headers' do
      stub_request(:put, 'https://payment.preprod.online-payments.com/v1/put-context')
        .to_return(status: 200, body: '{"result":"OK"}', headers: response_headers)
      context = CallContext.new('test-idempotence-key')

      sdk_communicator.put('/v1/put-context', nil, nil, CommunicatorSpecObject.new('request' => 'body'), CommunicatorSpecObject, context)

      expect(context.idempotence_key).to eq('test-idempotence-key')
      expect(context.idempotence_request_timestamp).to eq('123456789')
      expect(context.idempotence_response_date_time).to eq(DateTime.parse('2026-04-02T10:15:30Z'))
    end

    it 'updates the call context from DELETE response headers' do
      stub_request(:delete, 'https://payment.preprod.online-payments.com/v1/delete-context')
        .to_return(status: 200, body: '{"result":"OK"}', headers: response_headers)
      context = CallContext.new('test-idempotence-key')

      sdk_communicator.delete('/v1/delete-context', nil, nil, CommunicatorSpecObject, context)

      expect(context.idempotence_key).to eq('test-idempotence-key')
      expect(context.idempotence_request_timestamp).to eq('123456789')
      expect(context.idempotence_response_date_time).to eq(DateTime.parse('2026-04-02T10:15:30Z'))
    end
  end

  context 'constructor validation' do
    it 'requires an api endpoint' do
      expect do
        Communicator.new(nil, connection, MockAuthenticator.new, metadata_provider, DefaultMarshaller.instance)
      end.to raise_error(ArgumentError, /api_endpoint is required/)
    end

    it 'requires a connection' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com', nil, MockAuthenticator.new, metadata_provider,
                         DefaultMarshaller.instance)
      end.to raise_error(ArgumentError, /connection is required/)
    end

    it 'requires an authenticator' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com', connection, nil, metadata_provider,
                         DefaultMarshaller.instance)
      end.to raise_error(ArgumentError, /authenticator is required/)
    end

    it 'requires a metadata provider' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com', connection, MockAuthenticator.new, nil,
                         DefaultMarshaller.instance)
      end.to raise_error(ArgumentError, /metadata_provider is required/)
    end

    it 'requires a marshaller' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com', connection, MockAuthenticator.new,
                         metadata_provider, nil)
      end.to raise_error(ArgumentError, /marshaller is required/)
    end

    it 'rejects api endpoints with a path' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com/v1', connection, MockAuthenticator.new,
                         metadata_provider, DefaultMarshaller.instance)
      end.to raise_error(RuntimeError, /api_endpoint should not contain a path/)
    end

    it 'rejects api endpoints with user info' do
      expect do
        Communicator.new('https://user:pass@payment.preprod.online-payments.com', connection, MockAuthenticator.new,
                         metadata_provider, DefaultMarshaller.instance)
      end.to raise_error(RuntimeError, /api_endpoint should not contain user info/)
    end

    it 'rejects api endpoints with a query string' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com?key=value', connection, MockAuthenticator.new,
                         metadata_provider, DefaultMarshaller.instance)
      end.to raise_error(RuntimeError, /api_endpoint should not contain user info/)
    end

    it 'rejects api endpoints with a fragment' do
      expect do
        Communicator.new('https://payment.preprod.online-payments.com#section', connection, MockAuthenticator.new,
                         metadata_provider, DefaultMarshaller.instance)
      end.to raise_error(RuntimeError, /api_endpoint should not contain user info/)
    end
  end

  context 'close' do
    it 'delegates close to the connection' do
      expect(connection).to receive(:close)

      communicator.close
    end

    it 'propagates connection close errors' do
      allow(connection).to receive(:close).and_raise(IOError, 'Connection error')

      expect { communicator.close }.to raise_error(IOError, 'Connection error')
    end
  end
end
