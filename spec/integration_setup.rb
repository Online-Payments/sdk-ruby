require 'spec_helper'
require 'yaml'
require 'dotenv'

Dotenv.load(File.expand_path('../.env', __dir__))

module Integration
  REQUIRED_ENVIRONMENT_VARIABLES = %w[ONLINEPAYMENTS_API_KEY_ID ONLINEPAYMENTS_SECRET_API_KEY ONLINEPAYMENTS_MERCHANT_ID].freeze
  MISSING_ENVIRONMENT_VARIABLES = REQUIRED_ENVIRONMENT_VARIABLES.select { |name| ENV[name].to_s.empty? }.freeze
  MERCHANT_ID = ENV['ONLINEPAYMENTS_MERCHANT_ID']
  API_KEY_ID = ENV['ONLINEPAYMENTS_API_KEY_ID']
  SECRET_API_KEY = ENV['ONLINEPAYMENTS_SECRET_API_KEY']
  API_ENDPOINT = ENV['ONLINEPAYMENTS_API_ENDPOINT'].to_s.empty? ? 'https://payment.direct.ecom.preprod.worldline-solutions.com' : ENV['ONLINEPAYMENTS_API_ENDPOINT']
  PROPERTIES_URI = File.absolute_path(File.join(__FILE__, '../fixtures/resources/properties.v1hmac.yml'))
  PROPERTIES_URI_PROXY = File.absolute_path(File.join(__FILE__, '../fixtures/resources/properties.proxy.yml'))

  def self.init_communicator_configuration(properties_url: PROPERTIES_URI, max_connections: nil)
    yaml = YAML.load_file(properties_url)
    configuration = OnlinePayments::SDK::CommunicatorConfiguration.new(properties: yaml,
                                                                       api_endpoint: API_ENDPOINT,
                                                                       authorization_type: 'v1HMAC',
                                                                       api_key_id: API_KEY_ID,
                                                                       secret_api_key: SECRET_API_KEY,
                                                                       max_connections: max_connections)
    configuration
  end

  def self.init_client(with_proxy, max_connections = nil)
    if with_proxy
      url = PROPERTIES_URI_PROXY
    else
      url = PROPERTIES_URI
    end
    yaml = YAML.load_file(url)
    configuration = init_communicator_configuration(properties_url: url, max_connections: max_connections)
    yield client = OnlinePayments::SDK::Factory.create_client_from_configuration(configuration).with_client_meta_info('{"test":"test"}')
    client.close
  end
end

unless Integration::MISSING_ENVIRONMENT_VARIABLES.empty?
  RSpec.configure do |config|
    config.prepend_before(:context, file_path: %r{/spec/integration/}) do
      skip "integration tests need the environment variables #{Integration::MISSING_ENVIRONMENT_VARIABLES.join(', ')}"
    end
  end
end
