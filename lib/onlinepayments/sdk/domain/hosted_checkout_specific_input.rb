#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_payment_method_specific_input_for_hosted_checkout'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filters_hosted_checkout'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] allowed_number_of_payment_attempts
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputForHostedCheckout] card_payment_method_specific_input
      # @attr [true/false] is_recurring
      # @attr [String] locale
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFiltersHostedCheckout] payment_product_filters
      # @attr [String] return_url
      # @attr [Integer] session_timeout
      # @attr [true/false] show_result_page
      # @attr [String] tokens
      # @attr [String] variant
      class HostedCheckoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :allowed_number_of_payment_attempts

        attr_accessor :card_payment_method_specific_input

        attr_accessor :is_recurring

        attr_accessor :locale

        attr_accessor :payment_product_filters

        attr_accessor :return_url

        attr_accessor :session_timeout

        attr_accessor :show_result_page

        attr_accessor :tokens

        attr_accessor :variant

        # @return (Hash)
        def to_h
          hash = super
          hash['allowedNumberOfPaymentAttempts'] = @allowed_number_of_payment_attempts unless @allowed_number_of_payment_attempts.nil?
          hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h unless @card_payment_method_specific_input.nil?
          hash['isRecurring'] = @is_recurring unless @is_recurring.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['paymentProductFilters'] = @payment_product_filters.to_h unless @payment_product_filters.nil?
          hash['returnUrl'] = @return_url unless @return_url.nil?
          hash['sessionTimeout'] = @session_timeout unless @session_timeout.nil?
          hash['showResultPage'] = @show_result_page unless @show_result_page.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash['variant'] = @variant unless @variant.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'allowedNumberOfPaymentAttempts'
            @allowed_number_of_payment_attempts = hash['allowedNumberOfPaymentAttempts']
          end
          if hash.has_key? 'cardPaymentMethodSpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['cardPaymentMethodSpecificInput']] unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
            @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputForHostedCheckout.new_from_hash(hash['cardPaymentMethodSpecificInput'])
          end
          if hash.has_key? 'isRecurring'
            @is_recurring = hash['isRecurring']
          end
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'paymentProductFilters'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProductFilters']] unless hash['paymentProductFilters'].is_a? Hash
            @payment_product_filters = OnlinePayments::SDK::Domain::PaymentProductFiltersHostedCheckout.new_from_hash(hash['paymentProductFilters'])
          end
          if hash.has_key? 'returnUrl'
            @return_url = hash['returnUrl']
          end
          if hash.has_key? 'sessionTimeout'
            @session_timeout = hash['sessionTimeout']
          end
          if hash.has_key? 'showResultPage'
            @show_result_page = hash['showResultPage']
          end
          if hash.has_key? 'tokens'
            @tokens = hash['tokens']
          end
          if hash.has_key? 'variant'
            @variant = hash['variant']
          end
        end
      end
    end
  end
end
