require 'rspec'
require 'webmock/rspec'

require 'onlinepayments/sdk'
require 'comparable_extension'

RSpec.configure do |config|

  WebMock.disable_net_connect! # make it explicit

  config.order = 'random'
  config.profile_examples = 5 # show the slowest tests

  # declaration of constants to use throughout the tests
  config.before(:suite) do
    class MockAuthenticator < OnlinePayments::SDK::Authentication::Authenticator
      def get_authorization(http_method, resource_uri, request_headers)
        'ignored'
      end
    end

    PROPERTIES_URI = File.expand_path('../../spec/fixtures/resources/properties.v1hmac.yml', __FILE__)
    API_KEY_ID = 'someId'
    SECRET_API_KEY = 'someSecret'
    authenticator = MockAuthenticator.new
    COMMUNICATOR = OnlinePayments::SDK::Factory.create_communicator_from_file(PROPERTIES_URI, API_KEY_ID, SECRET_API_KEY,
                                                                              authenticator: authenticator)
    CLIENT = OnlinePayments::SDK::Factory.create_client_from_communicator(COMMUNICATOR)
  end

  config.after(:suite) { CLIENT.close }
end
