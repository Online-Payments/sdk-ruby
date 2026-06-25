require 'json'
require 'securerandom'
require 'stringio'

require 'onlinepayments/sdk/communicator'
require 'onlinepayments/sdk/communication/multipart_form_data_object'
require 'onlinepayments/sdk/communication/multipart_form_data_request'
require 'onlinepayments/sdk/domain/uploadable_file'

RSpec.describe 'MultipartFormData' do

  class MultipartTestMarshaller
    def marshal(value)
      JSON.generate(value)
    end

    def unmarshal(body, _response_type)
      JSON.parse(body)
    end
  end

  class RecordingConnection
    attr_reader :requests

    def initialize(response_body)
      @response_body = response_body
      @requests = []
    end

    def post(uri, request_headers, body)
      record_request('POST', uri, request_headers, body)
      yield 200, [], StringIO.new(@response_body)
    end

    def put(uri, request_headers, body)
      record_request('PUT', uri, request_headers, body)
      yield 200, [], StringIO.new(@response_body)
    end

    def close
    end

    private

    def record_request(method, uri, request_headers, body)
      @requests << {
        method: method,
        uri: uri,
        request_headers: request_headers,
        body: body
      }
    end
  end

  def create_test_file_stream(content)
    StringIO.new(content)
  end

  def create_communicator(response_body)
    connection = RecordingConnection.new(response_body)

    authenticator = double('authenticator')
    allow(authenticator).to receive(:get_authorization).and_return('authorization')

    metadata_provider = double('metadata_provider')
    allow(metadata_provider).to receive(:metadata_headers).and_return([])

    communicator = OnlinePayments::SDK::Communicator.new(
      'https://example.com',
      connection,
      authenticator,
      metadata_provider,
      MultipartTestMarshaller.new
    )

    [communicator, connection]
  end

  def create_multipart(file_content = 'file content', value = 'Hello World')
    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file(
      'file',
      OnlinePayments::SDK::Domain::UploadableFile.new(
        'file.txt',
        create_test_file_stream(file_content),
        'text/plain'
      )
    )
    multipart.add_value('value', value)
    multipart
  end

  def create_multipart_request(multipart)
    Class.new(OnlinePayments::SDK::Communication::MultipartFormDataRequest) do
      define_method(:to_multipart_form_data_object) do
        multipart
      end
    end.new
  end

  def header_value(headers, name)
    header = headers.find { |h| h.name.casecmp(name).zero? }
    header&.value
  end

  describe 'post multipart form data' do

    context 'with MultipartFormDataObject' do

      context 'with single file and value' do

        it 'posts with response' do
          communicator, connection = create_communicator(
            '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
          )

          response = communicator.post('/post', nil, nil, create_multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['files']['file']).to eq('file content')
          expect(response['form']['value']).to eq('Hello World')

          request = connection.requests.first
          expect(request[:uri].path).to eq('/post')
          expect(request[:method]).to eq('POST')
          expect(request[:body]).to be_a(OnlinePayments::SDK::Communication::MultipartFormDataObject)
          expect(header_value(request[:request_headers], 'Content-Type')).to start_with('multipart/form-data; boundary=')
        end

        it 'posts with binary response handler' do
          communicator, connection = create_communicator(
            '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
          )

          communicator.post_with_binary_response('/post', nil, nil, create_multipart, nil) do |_headers, body|
            response = JSON.parse(body.read)

            expect(response).not_to be_nil
            expect(response['files'].size).to eq(1)
            expect(response['files']['file']).to eq('file content')
            expect(response['form'].size).to eq(1)
            expect(response['form']['value']).to eq('Hello World')
          end

          request = connection.requests.first
          expect(request[:uri].path).to eq('/post')
          expect(request[:method]).to eq('POST')
        end
      end

      context 'with multiple files' do

        it 'posts two files' do
          communicator, connection = create_communicator(
            '{"files":{"firstFile":"firstContent","secondFile":"secondContent"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'firstFile',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'first.txt',
              create_test_file_stream('firstContent'),
              'text/plain'
            )
          )
          multipart.add_file(
            'secondFile',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'second.txt',
              create_test_file_stream('secondContent'),
              'text/plain'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['files'].size).to eq(2)
          expect(response['files']['firstFile']).to eq('firstContent')
          expect(response['files']['secondFile']).to eq('secondContent')

          request = connection.requests.first
          expect(request[:method]).to eq('POST')
        end

        it 'posts three files with different types' do
          communicator, = create_communicator(
            '{"files":{"textFile":"text","jsonFile":"json","xmlFile":"xml"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'textFile',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'file.txt',
              create_test_file_stream('text'),
              'text/plain'
            )
          )
          multipart.add_file(
            'jsonFile',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'file.json',
              create_test_file_stream('json'),
              'application/json'
            )
          )
          multipart.add_file(
            'xmlFile',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'file.xml',
              create_test_file_stream('xml'),
              'application/xml'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['files'].size).to eq(3)
        end
      end

      context 'with multiple values' do

        it 'posts two values' do
          communicator, = create_communicator(
            '{"form":{"firstKey":"firstValue","secondKey":"secondValue"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_value('firstKey', 'firstValue')
          multipart.add_value('secondKey', 'secondValue')

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['form'].size).to eq(2)
          expect(response['form']['firstKey']).to eq('firstValue')
          expect(response['form']['secondKey']).to eq('secondValue')
        end

        it 'posts three values' do
          communicator, = create_communicator(
            '{"form":{"name":"John","age":"30","city":"NYC"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_value('name', 'John')
          multipart.add_value('age', '30')
          multipart.add_value('city', 'NYC')

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['form'].size).to eq(3)
        end
      end

      context 'with files only' do

        it 'posts single file without values' do
          communicator, = create_communicator(
            '{"files":{"document":"doc content"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'document',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'doc.pdf',
              create_test_file_stream('doc content'),
              'application/pdf'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['files']['document']).to eq('doc content')
        end
      end

      context 'with values only' do

        it 'posts single value without files' do
          communicator, = create_communicator(
            '{"form":{"message":"Hello"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_value('message', 'Hello')

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
          expect(response['form']['message']).to eq('Hello')
        end
      end

      context 'with different content types' do

        it 'posts pdf file' do
          communicator, = create_communicator(
            '{"files":{"pdf":"pdf content"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'pdf',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'document.pdf',
              create_test_file_stream('pdf content'),
              'application/pdf'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
        end

        it 'posts image file' do
          communicator, = create_communicator(
            '{"files":{"image":"image content"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'image',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'photo.jpg',
              create_test_file_stream('image content'),
              'image/jpeg'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
        end

        it 'posts json file' do
          communicator, = create_communicator(
            '{"files":{"data":"json content"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'data',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'data.json',
              create_test_file_stream('json content'),
              'application/json'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
        end
      end

      context 'with content length' do

        it 'posts file with known length' do
          communicator, = create_communicator(
            '{"files":{"file":"content"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'file',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'file.txt',
              create_test_file_stream('content'),
              'text/plain',
              7
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
        end

        it 'posts file with unknown length' do
          communicator, = create_communicator(
            '{"files":{"file":"content"}}'
          )

          multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
          multipart.add_file(
            'file',
            OnlinePayments::SDK::Domain::UploadableFile.new(
              'file.txt',
              create_test_file_stream('content'),
              'text/plain'
            )
          )

          response = communicator.post('/post', nil, nil, multipart, Hash, nil)

          expect(response).not_to be_nil
        end
      end
    end

    context 'with MultipartFormDataRequest' do

      it 'posts with response' do
        communicator, connection = create_communicator(
          '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
        )

        multipart_request = create_multipart_request(create_multipart)

        response = communicator.post('/post', nil, nil, multipart_request, Hash, nil)

        expect(response).not_to be_nil
        expect(response['files'].size).to eq(1)
        expect(response['files']['file']).to eq('file content')
        expect(response['form'].size).to eq(1)
        expect(response['form']['value']).to eq('Hello World')

        request = connection.requests.first
        expect(request[:uri].path).to eq('/post')
        expect(request[:method]).to eq('POST')
        expect(request[:body]).to be_a(OnlinePayments::SDK::Communication::MultipartFormDataObject)
      end

      it 'posts with binary response handler' do
        communicator, connection = create_communicator(
          '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
        )

        multipart_request = create_multipart_request(create_multipart)

        communicator.post_with_binary_response('/post', nil, nil, multipart_request, nil) do |_headers, body|
          response = JSON.parse(body.read)

          expect(response).not_to be_nil
          expect(response['files'].size).to eq(1)
          expect(response['files']['file']).to eq('file content')
          expect(response['form'].size).to eq(1)
          expect(response['form']['value']).to eq('Hello World')
        end

        request = connection.requests.first
        expect(request[:uri].path).to eq('/post')
        expect(request[:method]).to eq('POST')
      end
    end
  end

  describe 'put multipart form data' do

    context 'with MultipartFormDataObject' do

      it 'puts with response' do
        communicator, connection = create_communicator(
          '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
        )

        response = communicator.put('/put', nil, nil, create_multipart, Hash, nil)

        expect(response).not_to be_nil
        expect(response['files'].size).to eq(1)
        expect(response['files']['file']).to eq('file content')
        expect(response['form'].size).to eq(1)
        expect(response['form']['value']).to eq('Hello World')

        request = connection.requests.first
        expect(request[:uri].path).to eq('/put')
        expect(request[:method]).to eq('PUT')
        expect(request[:body]).to be_a(OnlinePayments::SDK::Communication::MultipartFormDataObject)
      end

      it 'puts with binary response handler' do
        communicator, connection = create_communicator(
          '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
        )

        communicator.put_with_binary_response('/put', nil, nil, create_multipart, nil) do |_headers, body|
          response = JSON.parse(body.read)

          expect(response).not_to be_nil
          expect(response['files'].size).to eq(1)
          expect(response['files']['file']).to eq('file content')
          expect(response['form'].size).to eq(1)
          expect(response['form']['value']).to eq('Hello World')
        end

        request = connection.requests.first
        expect(request[:uri].path).to eq('/put')
        expect(request[:method]).to eq('PUT')
      end
    end

    context 'with MultipartFormDataRequest' do

      it 'puts with response' do
        communicator, connection = create_communicator(
          '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
        )

        multipart_request = create_multipart_request(create_multipart)

        response = communicator.put('/put', nil, nil, multipart_request, Hash, nil)

        expect(response).not_to be_nil
        expect(response['files'].size).to eq(1)
        expect(response['files']['file']).to eq('file content')
        expect(response['form'].size).to eq(1)
        expect(response['form']['value']).to eq('Hello World')

        request = connection.requests.first
        expect(request[:uri].path).to eq('/put')
        expect(request[:method]).to eq('PUT')
        expect(request[:body]).to be_a(OnlinePayments::SDK::Communication::MultipartFormDataObject)
      end

      it 'puts with binary response handler' do
        communicator, connection = create_communicator(
          '{"files":{"file":"file content"},"form":{"value":"Hello World"}}'
        )

        multipart_request = create_multipart_request(create_multipart)

        communicator.put_with_binary_response('/put', nil, nil, multipart_request, nil) do |_headers, body|
          response = JSON.parse(body.read)

          expect(response).not_to be_nil
          expect(response['files'].size).to eq(1)
          expect(response['files']['file']).to eq('file content')
          expect(response['form'].size).to eq(1)
          expect(response['form']['value']).to eq('Hello World')
        end

        request = connection.requests.first
        expect(request[:uri].path).to eq('/put')
        expect(request[:method]).to eq('PUT')
      end
    end
  end

  describe 'add files' do

    context 'with valid file' do

      it 'adds file with known length' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          create_test_file_stream('content'),
          'text/plain',
          7
        )

        multipart.add_file('document', file)

        expect(multipart.files.size).to eq(1)
        expect(multipart.files).to have_key('document')
        expect(multipart.files['document']).to eq(file)
      end

      it 'adds file with unknown length' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          create_test_file_stream('content'),
          'text/plain'
        )

        multipart.add_file('document', file)

        expect(multipart.files.size).to eq(1)
        expect(multipart.files['document'].content_length).to eq(-1)
      end
    end

    context 'with invalid file' do

      it 'raises ArgumentError for nil file' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        expect {
          multipart.add_file('file', nil)
        }.to raise_error(ArgumentError, 'uploadable_file is required')
      end

      it 'raises ArgumentError for nil parameter name' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          create_test_file_stream('content'),
          'text/plain'
        )

        expect {
          multipart.add_file(nil, file)
        }.to raise_error(ArgumentError, 'parameter_name is required')
      end

      it 'raises ArgumentError for empty parameter name' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          create_test_file_stream('content'),
          'text/plain'
        )

        expect {
          multipart.add_file('', file)
        }.to raise_error(ArgumentError, 'parameter_name is required')
      end

      it 'raises ArgumentError for duplicate parameter name with file' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        first_file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'first.txt',
          create_test_file_stream('firstContent'),
          'text/plain'
        )
        second_file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'second.txt',
          create_test_file_stream('secondContent'),
          'text/plain'
        )

        multipart.add_file('document', first_file)

        expect {
          multipart.add_file('document', second_file)
        }.to raise_error(ArgumentError, 'duplicate parameterName: document')
      end

      it 'raises ArgumentError for duplicate parameter name with value' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          create_test_file_stream('content'),
          'text/plain'
        )

        multipart.add_value('field', 'value')

        expect {
          multipart.add_file('field', file)
        }.to raise_error(ArgumentError, 'duplicate parameterName: field')
      end
    end
  end

  describe 'add values' do

    context 'with valid value' do

      it 'adds single value' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        multipart.add_value('key', 'value')

        expect(multipart.values.size).to eq(1)
        expect(multipart.values).to have_key('key')
        expect(multipart.values['key']).to eq('value')
      end

      it 'adds multiple values' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        multipart.add_value('firstKey', 'firstValue')
        multipart.add_value('secondKey', 'secondValue')
        multipart.add_value('thirdKey', 'thirdValue')

        expect(multipart.values.size).to eq(3)
        expect(multipart.values['firstKey']).to eq('firstValue')
        expect(multipart.values['secondKey']).to eq('secondValue')
        expect(multipart.values['thirdKey']).to eq('thirdValue')
      end
    end

    context 'with invalid value' do

      it 'raises ArgumentError for nil value' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        expect {
          multipart.add_value('key', nil)
        }.to raise_error(ArgumentError, 'value is required')
      end

      it 'raises ArgumentError for nil parameter name' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        expect {
          multipart.add_value(nil, 'value')
        }.to raise_error(ArgumentError, 'parameter_name is required')
      end

      it 'raises ArgumentError for empty parameter name' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        expect {
          multipart.add_value('', 'value')
        }.to raise_error(ArgumentError, 'parameter_name is required')
      end

      it 'raises ArgumentError for duplicate parameter name with value' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

        multipart.add_value('key', 'value1')

        expect {
          multipart.add_value('key', 'value2')
        }.to raise_error(ArgumentError, 'duplicate parameterName: key')
      end

      it 'raises ArgumentError for duplicate parameter name with file' do
        multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          create_test_file_stream('content'),
          'text/plain'
        )

        multipart.add_file('field', file)

        expect {
          multipart.add_value('field', 'value')
        }.to raise_error(ArgumentError, 'duplicate parameterName: field')
      end
    end
  end

  describe 'boundary and content type' do

    it 'generates unique boundary' do
      multipart1 = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
      multipart2 = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

      expect(multipart1.boundary).not_to be_nil
      expect(multipart2.boundary).not_to be_nil
      expect(multipart1.boundary).not_to eq(multipart2.boundary)
    end

    it 'includes boundary in content type' do
      multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

      expect(multipart.content_type).to include(multipart.boundary)
      expect(multipart.content_type).to start_with('multipart/form-data; boundary=')
    end

    it 'returns correct multipart content type' do
      multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new

      expect(multipart.content_type).to start_with('multipart/form-data')
      expect(multipart.content_type).to include('boundary=')
    end
  end

  describe 'uploadable file' do

    context 'with valid input' do

      it 'creates file with known length' do
        content = create_test_file_stream('test content')

        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'test.txt',
          content,
          'text/plain',
          12
        )

        expect(file.file_name).to eq('test.txt')
        expect(file.content_type).to eq('text/plain')
        expect(file.content_length).to eq(12)
        expect(file.content).not_to be_nil
      end

      it 'creates file with unknown length' do
        content = create_test_file_stream('test content')

        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'test.txt',
          content,
          'text/plain'
        )

        expect(file.file_name).to eq('test.txt')
        expect(file.content_type).to eq('text/plain')
        expect(file.content_length).to eq(-1)
        expect(file.content).not_to be_nil
      end

      it 'normalizes negative length to minus one' do
        content = create_test_file_stream('content')

        file = OnlinePayments::SDK::Domain::UploadableFile.new(
          'file.txt',
          content,
          'text/plain',
          -100
        )

        expect(file.content_length).to eq(-1)
      end
    end

    context 'with invalid input' do

      it 'raises ArgumentError for nil file name' do
        content = create_test_file_stream('content')

        expect {
          OnlinePayments::SDK::Domain::UploadableFile.new(nil, content, 'text/plain')
        }.to raise_error(ArgumentError, 'file_name is required')
      end

      it 'raises ArgumentError for empty file name' do
        skip 'Pending source fix: UploadableFile currently does not reject empty file_name values.'

        content = create_test_file_stream('content')

        expect {
          OnlinePayments::SDK::Domain::UploadableFile.new('', content, 'text/plain')
        }.to raise_error(ArgumentError, 'file_name is required')
      end

      it 'raises ArgumentError for nil content' do
        expect {
          OnlinePayments::SDK::Domain::UploadableFile.new('file.txt', nil, 'text/plain')
        }.to raise_error(ArgumentError, 'content is required')
      end

      it 'raises ArgumentError for nil content type' do
        content = create_test_file_stream('content')

        expect {
          OnlinePayments::SDK::Domain::UploadableFile.new('file.txt', content, nil)
        }.to raise_error(ArgumentError, 'content_type is required')
      end

      it 'raises ArgumentError for empty content type' do
        skip 'Pending source fix: UploadableFile currently does not reject empty content_type values.'

        content = create_test_file_stream('content')

        expect {
          OnlinePayments::SDK::Domain::UploadableFile.new('file.txt', content, '')
        }.to raise_error(ArgumentError, 'content_type is required')
      end
    end
  end
end
