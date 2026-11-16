require 'uri'
require 'onlinepayments/sdk'

module ClientSetup
  # [START client-setup]
  # Create the client once when the application starts, reuse it for every request and close it on shutdown.
  # Every value is validated here, so a wrong configuration stops the application at startup.
  # @return [OnlinePayments::SDK::Client]
  def self.create_client
    configuration = OnlinePayments::SDK::CommunicatorConfiguration.new(
      # Test or live host, e.g. payment.direct.ecom.preprod.worldline-solutions.com (without a path).
      api_endpoint: "https://#{required_env('onlinePayments_api_endpoint_host')}",
      api_key_id: required_env('onlinePayments_api_v1hmac_apiKeyId'),
      secret_api_key: required_env('onlinePayments_api_v1hmac_secretApiKey'),
      # Required: without it, creating the client raises RuntimeError "Unknown authorizationType".
      authorization_type: OnlinePayments::SDK::Authentication::AuthorizationType::V1HMAC,
      # Your company or application name; it identifies your requests in the platform logs.
      # Required: without it, the SDK raises ArgumentError "integrator is required".
      integrator: required_env('onlinePayments_api_integrator'),
      # In seconds.
      connect_timeout: 5,
      socket_timeout: 300,
      max_connections: 10
    )
    OnlinePayments::SDK::Factory.create_client_from_configuration(configuration)
  end

  # The merchant ID is your PSPID. All API calls start from the merchant client.
  # @param client [OnlinePayments::SDK::Client]
  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  def self.create_merchant_client(client)
    client.merchant(required_env('onlinePayments_api_merchantId'))
  end

  # The absolute public base URL of your shop, e.g. https://shop.example. The return URL of a checkout is built from
  # it, never from the Host header of a request, which the sender controls.
  # @return [String] without a trailing slash
  def self.public_base_url
    value = required_env('shop_publicBaseUrl')
    uri = URI.parse(value)
    unless uri.is_a?(URI::HTTP) && uri.host && !uri.host.empty? && uri.query.nil? && uri.fragment.nil?
      raise "shop_publicBaseUrl must be an absolute http(s) URL without query or fragment, e.g. https://shop.example"
    end

    value.strip.chomp('/')
  end

  # Read credentials from the environment or, better, a secret store of your platform, and never hard-code them.
  # For local development keep them in your own environment or a local secret store, not in a file in the repository.
  # A blank value counts as missing.
  # @param name [String]
  # @return [String]
  def self.required_env(name)
    value = ENV[name]
    raise "Environment variable #{name} is not set" if value.nil? || value.strip.empty?

    value
  end
  # [END client-setup]
end
