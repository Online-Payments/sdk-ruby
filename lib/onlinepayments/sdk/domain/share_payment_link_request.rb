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
          if hash.has_key? 'channel'
            @channel = hash['channel']
          end
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'recipient'
            @recipient = hash['recipient']
          end
        end
      end
    end
  end
end
