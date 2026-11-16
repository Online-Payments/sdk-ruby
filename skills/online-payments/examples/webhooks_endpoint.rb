require 'logger'
require 'onlinepayments/sdk'
require_relative 'webhooks_setup'

class WebhooksEndpoint
  # @param webhooks_helper [OnlinePayments::SDK::Webhooks::WebhooksHelper]
  # @param inbox [WebhookInbox]
  # @param logger [Logger]
  def initialize(webhooks_helper, inbox, logger)
    @webhooks_helper = webhooks_helper
    @inbox = inbox
    @logger = logger
  end

  # [START webhooks-receive]
  # Call this from your HTTP endpoint with the raw body and the two signature headers, e.g. in Sinatra:
  #   post '/webhooks' do
  #     status endpoint.receive(request.body.read, request.env['HTTP_X_GCS_SIGNATURE'], request.env['HTTP_X_GCS_KEYID'])
  #   end
  # In Rails use request.raw_post, request.headers['X-GCS-Signature'] and request.headers['X-GCS-KeyId'], and skip
  # the CSRF check for this action. Pass the body unchanged: parsing it as JSON first breaks the signature check.
  # The web layer has already collapsed repeated headers into one value here. If your framework exposes repeated
  # headers, pass each received value as its own RequestHeader and never merge them: the helper rejects a duplicate
  # X-GCS-Signature or X-GCS-KeyId, and a merged value would hide it.
  # Returns the HTTP status to answer with.
  # @param body [String]
  # @param signature [String, nil]
  # @param key_id [String, nil]
  # @return [Integer]
  def receive(body, signature, key_id)
    # A nil header value makes the SDK raise TypeError or NoMethodError instead of SignatureValidationException:
    # reject it first.
    return 401 if signature.nil? || signature.empty? || key_id.nil? || key_id.empty?

    request_headers = [
      OnlinePayments::SDK::Communication::RequestHeader.new('X-GCS-Signature', signature),
      OnlinePayments::SDK::Communication::RequestHeader.new('X-GCS-KeyId', key_id)
    ]
    begin
      # Checks the signature before parsing the event.
      webhooks_event = webhooks_helper.unmarshal(body, request_headers)
    rescue OnlinePayments::SDK::Webhooks::SignatureValidationException
      # Wrong or missing signature, or an unknown key ID (SecretKeyNotAvailableException is a subclass).
      # Not sent by the platform, or the wrong secret is configured. Do nothing with it.
      return 401
    rescue OnlinePayments::SDK::Webhooks::ApiVersionMismatchException,
           OnlinePayments::SDK::JSON::MarshallerSyntaxException => e
      # The signature is valid, so the platform sent it, but this SDK cannot read it. Neither class is a subclass
      # of SignatureValidationException. Do not answer with an error: a retry sends the same body and fails the same
      # way. Keep the raw body to replay it after you upgrade the SDK, and raise an alert.
      inbox.save_unreadable_body(body, e.class.name.to_s)
      logger.error("ALERT: verified webhook that the SDK cannot read (#{e.class}), raw body saved")
      return 200
    end
    # Save the verified event before you answer. Do not count on the platform sending the event again after a 2xx,
    # so an event that only lives in memory when the process dies can be lost. The inbox ignores duplicates.
    inbox.save_event(webhooks_event)
    # A background job processes the saved events. Slow or failed answers are retried by the platform.
    200
  end
  # [END webhooks-receive]

  private

  # @return [OnlinePayments::SDK::Webhooks::WebhooksHelper]
  attr_reader :webhooks_helper

  # @return [WebhookInbox]
  attr_reader :inbox

  # @return [Logger]
  attr_reader :logger
end
