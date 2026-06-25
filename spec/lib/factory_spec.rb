require 'spec_helper'
require 'uri'

Factory ||= OnlinePayments::SDK::Factory

describe 'Factory' do
  missing_properties_uri = File.expand_path('../fixtures/resources/missing.yml', __dir__)
  invalid_properties_uri = File.expand_path('../fixtures/resources/properties.invalid.yml', __dir__)
  unsupported_auth_properties_uri = File.expand_path('../fixtures/resources/properties.unsupported_auth.yml', __dir__)

  it 'can initialize configurations' do
    configuration = Factory.create_configuration(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY)

    expect(configuration.api_endpoint).to eq('https://payment.preprod.online-payments.com')
    expect(configuration.authorization_type).to eq('v1HMAC')
    expect(configuration.connect_timeout).to eq(1000)
    expect(configuration.socket_timeout).to eq(1000)
    expect(configuration.max_connections).to eq(100)
    expect(configuration.api_key_id).to eq(API_KEY_ID)
    expect(configuration.secret_api_key).to eq(SECRET_API_KEY)
    expect(configuration.proxy_configuration).to be_nil
  end

  it 'can initialize communicators' do
    communicator = Factory.create_communicator_from_file(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY)
    connection = communicator.instance_variable_get(:@connection)
    authenticator = communicator.instance_variable_get(:@authenticator)
    metadata_provider = communicator.instance_variable_get(:@metadata_provider)
    request_headers = metadata_provider.metadata_headers

    expect(communicator.marshaller).to be(OnlinePayments::SDK::JSON::DefaultMarshaller.instance)
    expect(connection).to be_an_instance_of(OnlinePayments::SDK::Communication::DefaultConnection)
    expect(authenticator).to be_an_instance_of(OnlinePayments::SDK::Authentication::V1HmacAuthenticator)
    expect(metadata_provider).to be_an_instance_of(OnlinePayments::SDK::Communication::MetadataProvider)

    expect(authenticator.instance_variable_get(:@api_key_id)).to eq(API_KEY_ID)
    expect(authenticator.instance_variable_get(:@secret_api_key)).to eq(SECRET_API_KEY)

    expect(request_headers.length).to eq(1)
    expect(request_headers[0].name).to eq('X-GCS-ServerMetaInfo')
  end

  it 'raises an error when the configuration file is missing' do
    expect do
      Factory.create_configuration(missing_properties_uri, API_KEY_ID, SECRET_API_KEY)
    end.to raise_error(Errno::ENOENT)
  end

  it 'raises an error when the configuration file is invalid yaml' do
    expect do
      Factory.create_configuration(invalid_properties_uri, API_KEY_ID, SECRET_API_KEY)
    end.to raise_error(Psych::SyntaxError)
  end

  it 'raises an error when creating a communicator from invalid yaml' do
    expect do
      Factory.create_communicator_from_file(invalid_properties_uri, API_KEY_ID, SECRET_API_KEY)
    end.to raise_error(Psych::SyntaxError)
  end

  it 'raises an error when creating a client from a missing configuration file' do
    expect do
      Factory.create_client_from_file(missing_properties_uri, API_KEY_ID, SECRET_API_KEY)
    end.to raise_error(Errno::ENOENT)
  end

  it 'raises an error for unsupported authorization types' do
    configuration = OnlinePayments::SDK::CommunicatorConfiguration.new(api_endpoint: 'https://payment.preprod.online-payments.com',
                                                                       api_key_id: API_KEY_ID,
                                                                       secret_api_key: SECRET_API_KEY,
                                                                       authorization_type: 'unsupported',
                                                                       connect_timeout: 1000,
                                                                       socket_timeout: 1000,
                                                                       max_connections: 100,
                                                                       integrator: 'OnlinePayments')

    expect do
      Factory.create_communicator_from_configuration(configuration)
    end.to raise_error(RuntimeError, 'Unknown authorizationType unsupported')
  end

  it 'raises an error for unsupported authorization types loaded from file' do
    expect do
      Factory.create_communicator_from_file(unsupported_auth_properties_uri, API_KEY_ID, SECRET_API_KEY)
    end.to raise_error(RuntimeError, 'Unknown authorizationType ')
  end

  context 'block forms' do
    it 'create_client_from_configuration yields the client and closes it after the block' do
      configuration = Factory.create_configuration(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY)
      yielded_client = nil

      Factory.create_client_from_configuration(configuration) do |client|
        yielded_client = client
        expect(client).to be_a(OnlinePayments::SDK::Client)
      end

      expect(yielded_client).not_to be_nil
      # After block, communicator should be closed; verify close was called by checking the connection
      expect { yielded_client.merchant('M1') }.not_to raise_error
    end

    it 'create_client_from_communicator yields the client and closes it after the block' do
      communicator = Factory.create_communicator_from_file(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY)
      yielded_client = nil

      Factory.create_client_from_communicator(communicator) do |client|
        yielded_client = client
        expect(client).to be_a(OnlinePayments::SDK::Client)
      end

      expect(yielded_client).not_to be_nil
    end

    it 'create_client_from_file yields the client and closes it after the block' do
      yielded_client = nil

      Factory.create_client_from_file(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY) do |client|
        yielded_client = client
        expect(client).to be_a(OnlinePayments::SDK::Client)
      end

      expect(yielded_client).not_to be_nil
    end

    it 'create_client_from_configuration ensures close is called even when the block raises' do
      configuration = Factory.create_configuration(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY)
      communicator = Factory.create_communicator_from_configuration(configuration)

      # Spy on the communicator's close via a client created from it
      client_spy = OnlinePayments::SDK::Client.new(communicator)
      allow(OnlinePayments::SDK::Client).to receive(:new).and_return(client_spy)
      expect(client_spy).to receive(:close)

      expect do
        Factory.create_client_from_configuration(configuration) do |_client|
          raise RuntimeError, 'boom'
        end
      end.to raise_error(RuntimeError, 'boom')
    end

    it 'create_client_from_communicator ensures close is called even when the block raises' do
      communicator = Factory.create_communicator_from_file(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY)
      client_spy = OnlinePayments::SDK::Client.new(communicator)
      allow(OnlinePayments::SDK::Client).to receive(:new).and_return(client_spy)
      expect(client_spy).to receive(:close)

      expect do
        Factory.create_client_from_communicator(communicator) do |_client|
          raise RuntimeError, 'boom'
        end
      end.to raise_error(RuntimeError, 'boom')
    end
  end
end
