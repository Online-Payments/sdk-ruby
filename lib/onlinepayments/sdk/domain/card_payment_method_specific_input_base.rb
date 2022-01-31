#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card_recurrence_details'
require 'onlinepayments/sdk/domain/payment_product130_specific_input'
require 'onlinepayments/sdk/domain/payment_product5100_specific_input'
require 'onlinepayments/sdk/domain/three_d_secure_base'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorization_mode
    # @attr [String] initial_scheme_transaction_id
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct130SpecificInput] payment_product130_specific_input
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct5100SpecificInput] payment_product5100_specific_input
    # @attr [Integer] payment_product_id
    # @attr [OnlinePayments::SDK::Domain::CardRecurrenceDetails] recurring
    # @attr [OnlinePayments::SDK::Domain::ThreeDSecureBase] three_d_secure
    # @attr [String] token
    # @attr [true/false] tokenize
    # @attr [String] transaction_channel
    # @attr [String] unscheduled_card_on_file_requestor
    # @attr [String] unscheduled_card_on_file_sequence_indicator
    class CardPaymentMethodSpecificInputBase < OnlinePayments::SDK::DataObject
      attr_accessor :authorization_mode
      attr_accessor :initial_scheme_transaction_id
      attr_accessor :payment_product130_specific_input
      attr_accessor :payment_product5100_specific_input
      attr_accessor :payment_product_id
      attr_accessor :recurring
      attr_accessor :three_d_secure
      attr_accessor :token
      attr_accessor :tokenize
      attr_accessor :transaction_channel
      attr_accessor :unscheduled_card_on_file_requestor
      attr_accessor :unscheduled_card_on_file_sequence_indicator

      # @return (Hash)
      def to_h
        hash = super
        hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
        hash['initialSchemeTransactionId'] = @initial_scheme_transaction_id unless @initial_scheme_transaction_id.nil?
        hash['paymentProduct130SpecificInput'] = @payment_product130_specific_input.to_h if @payment_product130_specific_input
        hash['paymentProduct5100SpecificInput'] = @payment_product5100_specific_input.to_h if @payment_product5100_specific_input
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['recurring'] = @recurring.to_h if @recurring
        hash['threeDSecure'] = @three_d_secure.to_h if @three_d_secure
        hash['token'] = @token unless @token.nil?
        hash['tokenize'] = @tokenize unless @tokenize.nil?
        hash['transactionChannel'] = @transaction_channel unless @transaction_channel.nil?
        hash['unscheduledCardOnFileRequestor'] = @unscheduled_card_on_file_requestor unless @unscheduled_card_on_file_requestor.nil?
        hash['unscheduledCardOnFileSequenceIndicator'] = @unscheduled_card_on_file_sequence_indicator unless @unscheduled_card_on_file_sequence_indicator.nil?
        hash
      end

      def from_hash(hash)
        super
        @authorization_mode = hash['authorizationMode'] if hash.key? 'authorizationMode'
        @initial_scheme_transaction_id = hash['initialSchemeTransactionId'] if hash.key? 'initialSchemeTransactionId'
        if hash.key? 'paymentProduct130SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct130SpecificInput']] unless hash['paymentProduct130SpecificInput'].is_a? Hash
          @payment_product130_specific_input = OnlinePayments::SDK::Domain::PaymentProduct130SpecificInput.new_from_hash(hash['paymentProduct130SpecificInput'])
        end
        if hash.key? 'paymentProduct5100SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5100SpecificInput']] unless hash['paymentProduct5100SpecificInput'].is_a? Hash
          @payment_product5100_specific_input = OnlinePayments::SDK::Domain::PaymentProduct5100SpecificInput.new_from_hash(hash['paymentProduct5100SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'recurring'
          raise TypeError, "value '%s' is not a Hash" % [hash['recurring']] unless hash['recurring'].is_a? Hash
          @recurring = OnlinePayments::SDK::Domain::CardRecurrenceDetails.new_from_hash(hash['recurring'])
        end
        if hash.key? 'threeDSecure'
          raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecure']] unless hash['threeDSecure'].is_a? Hash
          @three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecureBase.new_from_hash(hash['threeDSecure'])
        end
        @token = hash['token'] if hash.key? 'token'
        @tokenize = hash['tokenize'] if hash.key? 'tokenize'
        @transaction_channel = hash['transactionChannel'] if hash.key? 'transactionChannel'
        @unscheduled_card_on_file_requestor = hash['unscheduledCardOnFileRequestor'] if hash.key? 'unscheduledCardOnFileRequestor'
        @unscheduled_card_on_file_sequence_indicator = hash['unscheduledCardOnFileSequenceIndicator'] if hash.key? 'unscheduledCardOnFileSequenceIndicator'
      end
    end
  end
end
