#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/browser_data'

module OnlinePayments::SDK
  module Domain

    # @attr [String] accept_header
    # @attr [OnlinePayments::SDK::Domain::BrowserData] browser_data
    # @attr [String] ip_address
    # @attr [String] locale
    # @attr [String] timezone_offset_utc_minutes
    # @attr [String] user_agent
    class CustomerDevice < OnlinePayments::SDK::DataObject
      attr_accessor :accept_header
      attr_accessor :browser_data
      attr_accessor :ip_address
      attr_accessor :locale
      attr_accessor :timezone_offset_utc_minutes
      attr_accessor :user_agent

      # @return (Hash)
      def to_h
        hash = super
        hash['acceptHeader'] = @accept_header unless @accept_header.nil?
        hash['browserData'] = @browser_data.to_h if @browser_data
        hash['ipAddress'] = @ip_address unless @ip_address.nil?
        hash['locale'] = @locale unless @locale.nil?
        hash['timezoneOffsetUtcMinutes'] = @timezone_offset_utc_minutes unless @timezone_offset_utc_minutes.nil?
        hash['userAgent'] = @user_agent unless @user_agent.nil?
        hash
      end

      def from_hash(hash)
        super
        @accept_header = hash['acceptHeader'] if hash.key? 'acceptHeader'
        if hash.key? 'browserData'
          raise TypeError, "value '%s' is not a Hash" % [hash['browserData']] unless hash['browserData'].is_a? Hash
          @browser_data = OnlinePayments::SDK::Domain::BrowserData.new_from_hash(hash['browserData'])
        end
        @ip_address = hash['ipAddress'] if hash.key? 'ipAddress'
        @locale = hash['locale'] if hash.key? 'locale'
        @timezone_offset_utc_minutes = hash['timezoneOffsetUtcMinutes'] if hash.key? 'timezoneOffsetUtcMinutes'
        @user_agent = hash['userAgent'] if hash.key? 'userAgent'
      end
    end
  end
end
