# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/browser_data'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] accept_header
      # @attr [OnlinePayments::SDK::Domain::BrowserData, nil] browser_data
      # @attr [String, nil] device_fingerprint
      # @attr [String, nil] ip_address
      # @attr [String, nil] locale
      # @attr [String, nil] timezone_offset_utc_minutes
      # @attr [String, nil] user_agent
      class CustomerDevice < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accept_header

        attr_accessor :browser_data

        attr_accessor :device_fingerprint

        attr_accessor :ip_address

        attr_accessor :locale

        attr_accessor :timezone_offset_utc_minutes

        attr_accessor :user_agent

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(accept_header: nil,
                       browser_data: nil,
                       device_fingerprint: nil,
                       ip_address: nil,
                       locale: nil,
                       timezone_offset_utc_minutes: nil,
                       user_agent: nil)
          super()
          @accept_header = accept_header
          @browser_data = browser_data
          @device_fingerprint = device_fingerprint
          @ip_address = ip_address
          @locale = locale
          @timezone_offset_utc_minutes = timezone_offset_utc_minutes
          @user_agent = user_agent
        end

        # Sets the property and returns this same instance.
        def with_accept_header(value)
          @accept_header = value
          self
        end

        # Sets the property and returns this same instance.
        def with_browser_data(value)
          @browser_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_device_fingerprint(value)
          @device_fingerprint = value
          self
        end

        # Sets the property and returns this same instance.
        def with_ip_address(value)
          @ip_address = value
          self
        end

        # Sets the property and returns this same instance.
        def with_locale(value)
          @locale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_timezone_offset_utc_minutes(value)
          @timezone_offset_utc_minutes = value
          self
        end

        # Sets the property and returns this same instance.
        def with_user_agent(value)
          @user_agent = value
          self
        end

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
          if hash.key? 'acceptHeader'
            @accept_header = hash['acceptHeader']
          end
          if hash.key? 'browserData'
            raise TypeError, "value '#{hash['browserData']}' is not a Hash" unless hash['browserData'].is_a? Hash
            @browser_data = OnlinePayments::SDK::Domain::BrowserData.new_from_hash(hash['browserData'])
          end
          if hash.key? 'deviceFingerprint'
            @device_fingerprint = hash['deviceFingerprint']
          end
          if hash.key? 'ipAddress'
            @ip_address = hash['ipAddress']
          end
          if hash.key? 'locale'
            @locale = hash['locale']
          end
          if hash.key? 'timezoneOffsetUtcMinutes'
            @timezone_offset_utc_minutes = hash['timezoneOffsetUtcMinutes']
          end
          if hash.key? 'userAgent'
            @user_agent = hash['userAgent']
          end
        end
      end
    end
  end
end
