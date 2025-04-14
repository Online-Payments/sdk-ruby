#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] authorization_mode
      # @attr [Integer] payment_number
      # @attr [String] scheme_reference_data
      # @attr [String] subsequent_type
      # @attr [String] token
      # @attr [String] transaction_channel
      class SubsequentCardPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authorization_mode

        attr_accessor :payment_number

        # @deprecated Deprecated
        attr_accessor :scheme_reference_data

        attr_accessor :subsequent_type

        # @deprecated ID of the token to use to create the payment.
        attr_accessor :token

        attr_accessor :transaction_channel

        # @return (Hash)
        def to_h
          hash = super
          hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
          hash['paymentNumber'] = @payment_number unless @payment_number.nil?
          hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
          hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
          hash['token'] = @token unless @token.nil?
          hash['transactionChannel'] = @transaction_channel unless @transaction_channel.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'authorizationMode'
            @authorization_mode = hash['authorizationMode']
          end
          if hash.has_key? 'paymentNumber'
            @payment_number = hash['paymentNumber']
          end
          if hash.has_key? 'schemeReferenceData'
            @scheme_reference_data = hash['schemeReferenceData']
          end
          if hash.has_key? 'subsequentType'
            @subsequent_type = hash['subsequentType']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
          if hash.has_key? 'transactionChannel'
            @transaction_channel = hash['transactionChannel']
          end
        end
      end
    end
  end
end
