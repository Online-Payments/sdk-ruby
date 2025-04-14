#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/browser_data'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] accept_header
      # @attr [OnlinePayments::SDK::Domain::BrowserData] browser_data
      # @attr [String] device_fingerprint
      # @attr [String] ip_address
      # @attr [String] locale
      # @attr [String] timezone_offset_utc_minutes
      # @attr [String] user_agent
      class CustomerDevice < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accept_header

        attr_accessor :browser_data

        attr_accessor :device_fingerprint

        attr_accessor :ip_address

        attr_accessor :locale

        attr_accessor :timezone_offset_utc_minutes

        attr_accessor :user_agent

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptHeader'] = @accept_header unless @accept_header.nil?
          hash['browserData'] = @browser_data.to_h unless @browser_data.nil?
          hash['deviceFingerprint'] = @device_fingerprint unless @device_fingerprint.nil?
          hash['ipAddress'] = @ip_address unless @ip_address.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['timezoneOffsetUtcMinutes'] = @timezone_offset_utc_minutes unless @timezone_offset_utc_minutes.nil?
          hash['userAgent'] = @user_agent unless @user_agent.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acceptHeader'
            @accept_header = hash['acceptHeader']
          end
          if hash.has_key? 'browserData'
            raise TypeError, "value '%s' is not a Hash" % [hash['browserData']] unless hash['browserData'].is_a? Hash
            @browser_data = OnlinePayments::SDK::Domain::BrowserData.new_from_hash(hash['browserData'])
          end
          if hash.has_key? 'deviceFingerprint'
            @device_fingerprint = hash['deviceFingerprint']
          end
          if hash.has_key? 'ipAddress'
            @ip_address = hash['ipAddress']
          end
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'timezoneOffsetUtcMinutes'
            @timezone_offset_utc_minutes = hash['timezoneOffsetUtcMinutes']
          end
          if hash.has_key? 'userAgent'
            @user_agent = hash['userAgent']
          end
        end
      end
    end
  end
end
