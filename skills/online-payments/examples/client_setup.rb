require 'uri'
require 'onlinepayments/sdk'

module ClientSetup
  # [START client-setup]
  # Create the client once when the application starts, reuse it for every request and close it on shutdown.
  # Every value is validated here, so a wrong configuration stops the application at startup.
  # @return [OnlinePayments::SDK::Client]
  def self.create_client
    OnlinePayments::SDK::Factory.create_client(
      # Test or live endpoint, e.g. https://payment.direct.ecom.preprod.worldline-solutions.com (without a path).
      api_endpoint: required_env('ONLINEPAYMENTS_API_ENDPOINT'),
      api_key_id: required_env('ONLINEPAYMENTS_API_KEY_ID'),
      secret_api_key: required_env('ONLINEPAYMENTS_SECRET_API_KEY'),
      # Your company or application name; it identifies your requests in the platform logs.
      # Required: without it, the SDK raises ArgumentError "integrator is required".
      integrator: required_env('ONLINEPAYMENTS_INTEGRATOR'),
      # In seconds. Both are required and must be positive, otherwise the SDK raises ArgumentError.
      connect_timeout: 5,
      socket_timeout: 300,
      max_connections: 10
    )
  end

  # The merchant ID is your PSPID. All API calls start from the merchant client.
  # @param client [OnlinePayments::SDK::Client]
  # @return [OnlinePayments::SDK::Merchant::MerchantClient]
  def self.create_merchant_client(client)
    client.merchant(required_env('ONLINEPAYMENTS_MERCHANT_ID'))
  end

  # The absolute public base URL of your shop, e.g. https://shop.example. The return URL of a checkout is built from
  # it, never from the Host header of a request, which the sender controls.
  # @return [String] without a trailing slash
  def self.public_base_url
    value = required_env('SHOP_PUBLIC_BASE_URL')
    uri = URI.parse(value)
    unless uri.is_a?(URI::HTTP) && uri.host && !uri.host.empty? && uri.query.nil? && uri.fragment.nil?
      raise "SHOP_PUBLIC_BASE_URL must be an absolute http(s) URL without query or fragment, e.g. https://shop.example"
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
