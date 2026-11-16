require 'onlinepayments/sdk'
require_relative 'app_types'

module CustomerDeviceBuilder
  # [START customer-device]
  # 3-D Secure needs details about the customer's browser. Collect the browser values with JavaScript on the checkout
  # page and read the rest from the HTTP request (e.g. in Sinatra or Rails: request.env['HTTP_ACCEPT'],
  # request.user_agent, request.ip).
  # @param accept_header [String]
  # @param user_agent [String]
  # @param ip_address [String]
  # @param browser [BrowserInfo]
  # @return [OnlinePayments::SDK::Domain::CustomerDevice]
  def self.build_customer_device(accept_header, user_agent, ip_address, browser)
    browser_data = OnlinePayments::SDK::Domain::BrowserData.new
    browser_data.color_depth = browser.color_depth
    browser_data.java_enabled = browser.java_enabled
    browser_data.java_script_enabled = true
    browser_data.screen_height = browser.screen_height.to_s
    browser_data.screen_width = browser.screen_width.to_s

    device = OnlinePayments::SDK::Domain::CustomerDevice.new
    device.accept_header = accept_header
    device.user_agent = user_agent
    device.ip_address = ip_address
    device.locale = browser.locale
    device.timezone_offset_utc_minutes = browser.timezone_offset_utc_minutes.to_s
    device.browser_data = browser_data
    device
  end
  # [END customer-device]
end
