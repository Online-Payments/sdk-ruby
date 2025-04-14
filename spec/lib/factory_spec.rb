require 'spec_helper'
require 'uri'

Factory ||= OnlinePayments::SDK::Factory

describe 'Factory' do
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
end
