# Stand-ins for your application's own types and persistence. The examples use them where your code must store or read
# data; replace them with your own code.

# The payment state of an order in your application.
module OrderPaymentState
  PENDING = :pending
  AUTHORIZED = :authorized
  PAID = :paid
  FAILED = :failed
  CANCELLED = :cancelled
  REFUNDED = :refunded
  REVERSED = :reversed
end

# What the web layer must do after a create payment call: redirect the customer to redirect_url, or show the state.
class PaymentStep
  # @param redirect_url [String, nil]
  # @param state [Symbol, nil] one of the OrderPaymentState values
  def initialize(redirect_url: nil, state: nil)
    @redirect_url = redirect_url
    @state = state
  end

  # @return [String, nil]
  attr_reader :redirect_url

  # @return [Symbol, nil]
  attr_reader :state
end

class StoredHostedCheckout
  # @param hosted_checkout_id [String]
  # @param returnmac [String]
  def initialize(hosted_checkout_id, returnmac)
    @hosted_checkout_id = hosted_checkout_id
    @returnmac = returnmac
  end

  # @return [String]
  attr_reader :hosted_checkout_id

  # @return [String]
  attr_reader :returnmac
end

# Stand-in for your database code.
class OrderStore
  # @param order_id [String]
  # @param hosted_checkout_id [String]
  # @param returnmac [String]
  # @return [void]
  def save_hosted_checkout(order_id, hosted_checkout_id, returnmac)
    raise NotImplementedError
  end

  # @param order_id [String]
  # @return [StoredHostedCheckout]
  def get_hosted_checkout(order_id)
    raise NotImplementedError
  end

  # The idempotence key of the create call for this order. Store it before the call.
  # @param order_id [String]
  # @param idempotence_key [String]
  # @return [void]
  def save_idempotence_key(order_id, idempotence_key)
    raise NotImplementedError
  end

  # @param order_id [String]
  # @return [String, nil]
  def get_idempotence_key(order_id)
    raise NotImplementedError
  end

  # @param order_id [String]
  # @param payment_id [String]
  # @return [void]
  def save_payment_id(order_id, payment_id)
    raise NotImplementedError
  end

  # @param order_id [String]
  # @return [String, nil] nil while no payment ID is stored yet
  def get_payment_id(order_id)
    raise NotImplementedError
  end

  # @param order_id [String]
  # @param state [Symbol] one of the OrderPaymentState values
  # @return [void]
  def save_state(order_id, state)
    raise NotImplementedError
  end

  # @param customer_id [String]
  # @param initial_payment_id [String]
  # @return [void]
  def save_recurring_payment_id(customer_id, initial_payment_id)
    raise NotImplementedError
  end

  # @param customer_id [String]
  # @return [String]
  def get_recurring_payment_id(customer_id)
    raise NotImplementedError
  end
end

# Browser values collected with JavaScript on the checkout page.
class BrowserInfo
  # @param color_depth [Integer]
  # @param java_enabled [Boolean]
  # @param screen_height [Integer]
  # @param screen_width [Integer]
  # @param timezone_offset_utc_minutes [Integer]
  # @param locale [String]
  def initialize(color_depth:, java_enabled:, screen_height:, screen_width:, timezone_offset_utc_minutes:, locale:)
    @color_depth = color_depth
    @java_enabled = java_enabled
    @screen_height = screen_height
    @screen_width = screen_width
    @timezone_offset_utc_minutes = timezone_offset_utc_minutes
    @locale = locale
  end

  # @return [Integer]
  attr_reader :color_depth

  # @return [Boolean]
  attr_reader :java_enabled

  # @return [Integer]
  attr_reader :screen_height

  # @return [Integer]
  attr_reader :screen_width

  # @return [Integer]
  attr_reader :timezone_offset_utc_minutes

  # @return [String]
  attr_reader :locale
end

# Card details as entered by the customer. Never log or store this object.
class CardInput
  # @param number [String]
  # @param holder_name [String]
  # @param expiry_date [String] MMYY, e.g. 1230 for December 2030.
  # @param cvv [String]
  def initialize(number:, holder_name:, expiry_date:, cvv:)
    @number = number
    @holder_name = holder_name
    @expiry_date = expiry_date
    @cvv = cvv
  end

  # @return [String]
  attr_reader :number

  # @return [String]
  attr_reader :holder_name

  # @return [String]
  attr_reader :expiry_date

  # @return [String]
  attr_reader :cvv
end
