#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorization_mode
    # @attr [String] scheme_reference_data
    # @attr [String] subsequent_type
    # @attr [String] token
    # @attr [String] transaction_channel
    class SubsequentCardPaymentMethodSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :authorization_mode
      attr_accessor :scheme_reference_data
      attr_accessor :subsequent_type
      attr_accessor :token
      attr_accessor :transaction_channel

      # @return (Hash)
      def to_h
        hash = super
        hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
        hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
        hash['subsequentType'] = @subsequent_type unless @subsequent_type.nil?
        hash['token'] = @token unless @token.nil?
        hash['transactionChannel'] = @transaction_channel unless @transaction_channel.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorization_mode = hash['authorizationMode'] if hash.key? 'authorizationMode'
        @scheme_reference_data = hash['schemeReferenceData'] if hash.key? 'schemeReferenceData'
        @subsequent_type = hash['subsequentType'] if hash.key? 'subsequentType'
        @token = hash['token'] if hash.key? 'token'
        @transaction_channel = hash['transactionChannel'] if hash.key? 'transactionChannel'
      end
    end
  end
end
