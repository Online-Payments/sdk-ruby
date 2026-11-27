# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/auto_capture'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/market_place'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] authorization_mode
      # @attr [OnlinePayments::SDK::Domain::AutoCapture, nil] auto_capture
      # @attr [OnlinePayments::SDK::Domain::MarketPlace, nil] market_place
      # @attr [Integer, nil] payment_number
      # @attr [String, nil] scheme_reference_data
      # @attr [String, nil] subsequent_type
      # @attr [String, nil] token
      # @attr [String, nil] transaction_channel
      class SubsequentCardPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorization_mode

        attr_accessor :auto_capture

        attr_accessor :market_place

        attr_accessor :payment_number

        # @deprecated Deprecated
        attr_accessor :scheme_reference_data

        attr_accessor :subsequent_type

        # @deprecated ID of the token to use to create the payment.
        attr_accessor :token

        attr_accessor :transaction_channel

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(authorization_mode: nil,
                       auto_capture: nil,
                       market_place: nil,
                       payment_number: nil,
                       scheme_reference_data: nil,
                       subsequent_type: nil,
                       token: nil,
                       transaction_channel: nil)
          super()
          @authorization_mode = authorization_mode
          @auto_capture = auto_capture
          @market_place = market_place
          @payment_number = payment_number
          @scheme_reference_data = scheme_reference_data
          @subsequent_type = subsequent_type
          @token = token
          @transaction_channel = transaction_channel
        end

        # Sets the property and returns this same instance.
        def with_authorization_mode(value)
          @authorization_mode = value
          self
        end

        # Sets the property and returns this same instance.
        def with_auto_capture(value)
          @auto_capture = value
          self
        end

        # Sets the property and returns this same instance.
        def with_market_place(value)
          @market_place = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_number(value)
          @payment_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_scheme_reference_data(value)
          @scheme_reference_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_subsequent_type(value)
          @subsequent_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token(value)
          @token = value
          self
        end

        # Sets the property and returns this same instance.
        def with_transaction_channel(value)
          @transaction_channel = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
          hash['autoCapture'] = @auto_capture.to_h unless @auto_capture.nil?
          hash['marketPlace'] = @market_place.to_h unless @market_place.nil?
          hash['paymentNumber'] = @payment_number unless @payment_number.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
          hash['token'] = @token unless @token.nil?
          hash['transactionChannel'] = @transaction_channel unless @transaction_channel.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'authorizationMode'
            @authorization_mode = hash['authorizationMode']
          end
          if hash.key? 'autoCapture'
            raise TypeError, "value '#{hash['autoCapture']}' is not a Hash" unless hash['autoCapture'].is_a? Hash
            @auto_capture = OnlinePayments::SDK::Domain::AutoCapture.new_from_hash(hash['autoCapture'])
          end
          if hash.key? 'marketPlace'
            raise TypeError, "value '#{hash['marketPlace']}' is not a Hash" unless hash['marketPlace'].is_a? Hash
            @market_place = OnlinePayments::SDK::Domain::MarketPlace.new_from_hash(hash['marketPlace'])
          end
          if hash.key? 'paymentNumber'
            @payment_number = hash['paymentNumber']
          end
          if hash.key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.key? 'subsequentType'
            @subsequent_type = hash['subsequentType']
          end
          if hash.key? 'token'
            @token = hash['token']
          end
          if hash.key? 'transactionChannel'
            @transaction_channel = hash['transactionChannel']
          end
        end
      end
    end
  end
end
