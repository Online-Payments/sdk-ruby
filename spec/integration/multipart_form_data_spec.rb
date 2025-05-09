require 'json'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/communication/multipart_form_data_object'
require 'onlinepayments/sdk/communication/multipart_form_data_request'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/uploadable_file'

describe 'multipart/form-data support' do
  HTTPBIN_URL = ENV['httpbin_url'] || 'http://httpbin.org'

  before(:context) { WebMock.allow_net_connect! }
  after(:context) { WebMock.disable_net_connect! }

  it 'Can send a Multipart Form Data Object POST upload with a response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text/plain'
    )

    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    response = communicator.post('/post', nil, nil, multipart,
                                 HttpBinResponse, nil)

    expect(response.form['value']).to eq 'Hello World'
    expect(response.files['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Request POST upload with a response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text-plain'
    )

    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    response = communicator.post '/post', nil, nil,
                                 MultipartFormDataObjectWrapper.new(multipart), HttpBinResponse, nil

    expect(response.form['value']).to eq 'Hello World'
    expect(response.files['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Object POST upload with a binary response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text/plain'
    )
    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    data = ''
    communicator.post_with_binary_response '/post', nil, nil,
                                           multipart, nil do |_, c|
      data = c.read.force_encoding('UTF-8')
    end
    response = JSON.parse data

    expect(response['form']['value']).to eq 'Hello World'
    expect(response['files']['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Request POST upload with a binary response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text/plain'
    )
    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    data = ''
    communicator.post_with_binary_response '/post', nil, nil,
                                           MultipartFormDataObjectWrapper.new(multipart), nil do |_, c|
      data = c.read.force_encoding('UTF-8')
    end
    response = JSON.parse data

    expect(response['form']['value']).to eq 'Hello World'
    expect(response['files']['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Object PUT upload with a response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text/plain'
    )

    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    response = communicator.put('/put', nil, nil, multipart,
                                HttpBinResponse, nil)

    expect(response.form['value']).to eq 'Hello World'
    expect(response.files['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Request PUT upload with a response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text-plain'
    )

    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    response = communicator.put '/put', nil, nil,
                                MultipartFormDataObjectWrapper.new(multipart), HttpBinResponse, nil

    expect(response.form['value']).to eq 'Hello World'
    expect(response.files['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Object PUT upload with a binary response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text/plain'
    )
    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    data = ''
    communicator.put_with_binary_response '/put', nil, nil,
                                          multipart, nil do |_, c|
      data = c.read.force_encoding('UTF-8')
    end
    response = JSON.parse data

    expect(response['form']['value']).to eq 'Hello World'
    expect(response['files']['file']).to eq 'file-content'
  end

  it 'Can send a Multipart Form Data Request PUT upload with a binary response' do
    configuration = Integration.init_communicator_configuration
    configuration.api_endpoint = HTTPBIN_URL

    multipart = OnlinePayments::SDK::Communication::MultipartFormDataObject.new
    multipart.add_file 'file', OnlinePayments::SDK::Domain::UploadableFile.new(
      'file.txt', 'file-content', 'text/plain'
    )
    multipart.add_value 'value', 'Hello World'

    communicator = OnlinePayments::SDK::Factory.create_communicator_from_configuration configuration

    data = ''
    communicator.put_with_binary_response '/put', nil, nil,
                                                     MultipartFormDataObjectWrapper.new(multipart), nil do |_, c|
      data = c.read.force_encoding('UTF-8')
    end
    response = JSON.parse data

    expect(response['form']['value']).to eq 'Hello World'
    expect(response['files']['file']).to eq 'file-content'
  end
end

class HttpBinResponse < OnlinePayments::SDK::Domain::DataObject
  @form = nil
  @files = nil

  attr_reader :form
  attr_reader :files

  def from_hash(hash)
    super
    @form = hash['form'] if hash.key? 'form'
    @files = hash['files'] if hash.key? 'files'
  end
end

class MultipartFormDataObjectWrapper < OnlinePayments::SDK::Communication::MultipartFormDataRequest
  @multipart = nil

  attr_reader :multipart

  def initialize(multipart)
    @multipart = multipart
  end

  def to_multipart_form_data_object
    @multipart
  end
end
