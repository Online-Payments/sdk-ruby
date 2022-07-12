#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/card'
require 'onlinepayments/sdk/domain/card_recurrence_details'
require 'onlinepayments/sdk/domain/payment_product130_specific_input'
require 'onlinepayments/sdk/domain/three_d_secure'

module OnlinePayments::SDK
  module Domain

    # @attr [String] authorization_mode
    # @attr [OnlinePayments::SDK::Domain::Card] card
    # @attr [String] initial_scheme_transaction_id
    # @attr [true/false] is_recurring
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct130SpecificInput] payment_product130_specific_input
    # @attr [Integer] payment_product_id
    # @attr [OnlinePayments::SDK::Domain::CardRecurrenceDetails] recurring
    # @attr [String] return_url
    # @attr [String] scheme_reference_data
    # @attr [true/false] skip_authentication
    # @attr [OnlinePayments::SDK::Domain::ThreeDSecure] three_d_secure
    # @attr [String] token
    # @attr [true/false] tokenize
    # @attr [String] transaction_channel
    # @attr [String] unscheduled_card_on_file_requestor
    # @attr [String] unscheduled_card_on_file_sequence_indicator
    class CardPaymentMethodSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :authorization_mode
      attr_accessor :card
      attr_accessor :initial_scheme_transaction_id
      attr_accessor :is_recurring
      attr_accessor :payment_product130_specific_input
      attr_accessor :payment_product_id
      attr_accessor :recurring
      attr_accessor :return_url
      attr_accessor :scheme_reference_data
      attr_accessor :skip_authentication
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
        hash['card'] = @card.to_h if @card
        hash['initialSchemeTransactionId'] = @initial_scheme_transaction_id unless @initial_scheme_transaction_id.nil?
        hash['isRecurring'] = @is_recurring unless @is_recurring.nil?
        hash['paymentProduct130SpecificInput'] = @payment_product130_specific_input.to_h if @payment_product130_specific_input
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['recurring'] = @recurring.to_h if @recurring
        hash['returnUrl'] = @return_url unless @return_url.nil?
        hash['schemeReferenceData'] = @scheme_reference_data unless @scheme_reference_data.nil?
        hash['skipAuthentication'] = @skip_authentication unless @skip_authentication.nil?
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
        if hash.key? 'card'
          raise TypeError, "value '%s' is not a Hash" % [hash['card']] unless hash['card'].is_a? Hash
          @card = OnlinePayments::SDK::Domain::Card.new_from_hash(hash['card'])
        end
        @initial_scheme_transaction_id = hash['initialSchemeTransactionId'] if hash.key? 'initialSchemeTransactionId'
        @is_recurring = hash['isRecurring'] if hash.key? 'isRecurring'
        if hash.key? 'paymentProduct130SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct130SpecificInput']] unless hash['paymentProduct130SpecificInput'].is_a? Hash
          @payment_product130_specific_input = OnlinePayments::SDK::Domain::PaymentProduct130SpecificInput.new_from_hash(hash['paymentProduct130SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'recurring'
          raise TypeError, "value '%s' is not a Hash" % [hash['recurring']] unless hash['recurring'].is_a? Hash
          @recurring = OnlinePayments::SDK::Domain::CardRecurrenceDetails.new_from_hash(hash['recurring'])
        end
        @return_url = hash['returnUrl'] if hash.key? 'returnUrl'
        @scheme_reference_data = hash['schemeReferenceData'] if hash.key? 'schemeReferenceData'
        @skip_authentication = hash['skipAuthentication'] if hash.key? 'skipAuthentication'
        if hash.key? 'threeDSecure'
          raise TypeError, "value '%s' is not a Hash" % [hash['threeDSecure']] unless hash['threeDSecure'].is_a? Hash
          @three_d_secure = OnlinePayments::SDK::Domain::ThreeDSecure.new_from_hash(hash['threeDSecure'])
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
