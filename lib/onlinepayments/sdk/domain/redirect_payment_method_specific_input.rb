#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/redirect_payment_product3306_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5406_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product809_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product840_specific_input'
require 'onlinepayments/sdk/domain/redirection_data'

module OnlinePayments::SDK
  module Domain

    # @attr [String] payment_option
    # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct3306SpecificInput] payment_product3306_specific_input
    # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5406SpecificInput] payment_product5406_specific_input
    # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct809SpecificInput] payment_product809_specific_input
    # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct840SpecificInput] payment_product840_specific_input
    # @attr [Integer] payment_product_id
    # @attr [OnlinePayments::SDK::Domain::RedirectionData] redirection_data
    # @attr [true/false] requires_approval
    # @attr [String] token
    # @attr [true/false] tokenize
    class RedirectPaymentMethodSpecificInput < OnlinePayments::SDK::DataObject
      attr_accessor :payment_option
      attr_accessor :payment_product3306_specific_input
      attr_accessor :payment_product5406_specific_input
      attr_accessor :payment_product809_specific_input
      attr_accessor :payment_product840_specific_input
      attr_accessor :payment_product_id
      attr_accessor :redirection_data
      attr_accessor :requires_approval
      attr_accessor :token
      attr_accessor :tokenize

      # @return (Hash)
      def to_h
        hash = super
        hash['paymentOption'] = @payment_option unless @payment_option.nil?
        hash['paymentProduct3306SpecificInput'] = @payment_product3306_specific_input.to_h if @payment_product3306_specific_input
        hash['paymentProduct5406SpecificInput'] = @payment_product5406_specific_input.to_h if @payment_product5406_specific_input
        hash['paymentProduct809SpecificInput'] = @payment_product809_specific_input.to_h if @payment_product809_specific_input
        hash['paymentProduct840SpecificInput'] = @payment_product840_specific_input.to_h if @payment_product840_specific_input
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['redirectionData'] = @redirection_data.to_h if @redirection_data
        hash['requiresApproval'] = @requires_approval unless @requires_approval.nil?
        hash['token'] = @token unless @token.nil?
        hash['tokenize'] = @tokenize unless @tokenize.nil?
        hash
      end

      def from_hash(hash)
        super
        @payment_option = hash['paymentOption'] if hash.key? 'paymentOption'
        if hash.key? 'paymentProduct3306SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3306SpecificInput']] unless hash['paymentProduct3306SpecificInput'].is_a? Hash
          @payment_product3306_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct3306SpecificInput.new_from_hash(hash['paymentProduct3306SpecificInput'])
        end
        if hash.key? 'paymentProduct5406SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5406SpecificInput']] unless hash['paymentProduct5406SpecificInput'].is_a? Hash
          @payment_product5406_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5406SpecificInput.new_from_hash(hash['paymentProduct5406SpecificInput'])
        end
        if hash.key? 'paymentProduct809SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct809SpecificInput']] unless hash['paymentProduct809SpecificInput'].is_a? Hash
          @payment_product809_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct809SpecificInput.new_from_hash(hash['paymentProduct809SpecificInput'])
        end
        if hash.key? 'paymentProduct840SpecificInput'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840SpecificInput']] unless hash['paymentProduct840SpecificInput'].is_a? Hash
          @payment_product840_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct840SpecificInput.new_from_hash(hash['paymentProduct840SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'redirectionData'
          raise TypeError, "value '%s' is not a Hash" % [hash['redirectionData']] unless hash['redirectionData'].is_a? Hash
          @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
        end
        @requires_approval = hash['requiresApproval'] if hash.key? 'requiresApproval'
        @token = hash['token'] if hash.key? 'token'
        @tokenize = hash['tokenize'] if hash.key? 'tokenize'
      end
    end
  end
end
