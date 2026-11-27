# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] app_switch_link
      # @attr [String, nil] qr_code_url
      class PaymentProduct5404 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :app_switch_link

        attr_accessor :qr_code_url

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(app_switch_link: nil, qr_code_url: nil)
          super()
          @app_switch_link = app_switch_link
          @qr_code_url = qr_code_url
        end

        # Sets the property and returns this same instance.
        def with_app_switch_link(value)
          @app_switch_link = value
          self
        end

        # Sets the property and returns this same instance.
        def with_qr_code_url(value)
          @qr_code_url = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['appSwitchLink'] = @app_switch_link unless @app_switch_link.nil?
          hash['qrCodeUrl'] = @qr_code_url unless @qr_code_url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'appSwitchLink'
            @app_switch_link = hash['appSwitchLink']
          end
          if hash.key? 'qrCodeUrl'
            @qr_code_url = hash['qrCodeUrl']
          end
        end
      end
    end
  end
end
