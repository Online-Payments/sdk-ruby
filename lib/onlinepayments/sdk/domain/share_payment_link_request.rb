# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] channel
      # @attr [String, nil] locale
      # @attr [String, nil] recipient
      class SharePaymentLinkRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :channel

        attr_accessor :locale

        attr_accessor :recipient

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(channel: nil, locale: nil, recipient: nil)
          super()
          @channel = channel
          @locale = locale
          @recipient = recipient
        end

        # Sets the property and returns this same instance.
        def with_channel(value)
          @channel = value
          self
        end

        # Sets the property and returns this same instance.
        def with_locale(value)
          @locale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recipient(value)
          @recipient = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['channel'] = @channel unless @channel.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['recipient'] = @recipient unless @recipient.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'channel'
            @channel = hash['channel']
          end
          if hash.key? 'locale'
            @locale = hash['locale']
          end
          if hash.key? 'recipient'
            @recipient = hash['recipient']
          end
        end
      end
    end
  end
end
