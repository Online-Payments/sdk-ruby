# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/card_payment_method_specific_input_for_hosted_checkout'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filters_hosted_checkout'
require 'onlinepayments/sdk/domain/split_payment_product_filters_hosted_checkout'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] allowed_number_of_payment_attempts
      # @attr [true/false, nil] auto_refund_split_payments
      # @attr [OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputForHostedCheckout, nil] card_payment_method_specific_input
      # @attr [true/false, nil] is_new_unscheduled_card_on_file_series
      # @attr [true/false, nil] is_recurring
      # @attr [String, nil] locale
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFiltersHostedCheckout, nil] payment_product_filters
      # @attr [String, nil] return_url
      # @attr [Integer, nil] session_timeout
      # @attr [true/false, nil] show_result_page
      # @attr [OnlinePayments::SDK::Domain::SplitPaymentProductFiltersHostedCheckout, nil] split_payment_product_filters
      # @attr [String, nil] tokens
      # @attr [String, nil] variant
      class HostedCheckoutSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :allowed_number_of_payment_attempts

        attr_accessor :auto_refund_split_payments

        attr_accessor :card_payment_method_specific_input

        attr_accessor :is_new_unscheduled_card_on_file_series

        attr_accessor :is_recurring

        attr_accessor :locale

        attr_accessor :payment_product_filters

        attr_accessor :return_url

        attr_accessor :session_timeout

        attr_accessor :show_result_page

        attr_accessor :split_payment_product_filters

        attr_accessor :tokens

        attr_accessor :variant

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(allowed_number_of_payment_attempts: nil,
                       auto_refund_split_payments: nil,
                       card_payment_method_specific_input: nil,
                       is_new_unscheduled_card_on_file_series: nil,
                       is_recurring: nil,
                       locale: nil,
                       payment_product_filters: nil,
                       return_url: nil,
                       session_timeout: nil,
                       show_result_page: nil,
                       split_payment_product_filters: nil,
                       tokens: nil,
                       variant: nil)
          super()
          @allowed_number_of_payment_attempts = allowed_number_of_payment_attempts
          @auto_refund_split_payments = auto_refund_split_payments
          @card_payment_method_specific_input = card_payment_method_specific_input
          @is_new_unscheduled_card_on_file_series = is_new_unscheduled_card_on_file_series
          @is_recurring = is_recurring
          @locale = locale
          @payment_product_filters = payment_product_filters
          @return_url = return_url
          @session_timeout = session_timeout
          @show_result_page = show_result_page
          @split_payment_product_filters = split_payment_product_filters
          @tokens = tokens
          @variant = variant
        end

        # Sets the property and returns this same instance.
        def with_allowed_number_of_payment_attempts(value)
          @allowed_number_of_payment_attempts = value
          self
        end

        # Sets the property and returns this same instance.
        def with_auto_refund_split_payments(value)
          @auto_refund_split_payments = value
          self
        end

        # Sets the property and returns this same instance.
        def with_card_payment_method_specific_input(value)
          @card_payment_method_specific_input = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_new_unscheduled_card_on_file_series(value)
          @is_new_unscheduled_card_on_file_series = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_recurring(value)
          @is_recurring = value
          self
        end

        # Sets the property and returns this same instance.
        def with_locale(value)
          @locale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_filters(value)
          @payment_product_filters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_return_url(value)
          @return_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_session_timeout(value)
          @session_timeout = value
          self
        end

        # Sets the property and returns this same instance.
        def with_show_result_page(value)
          @show_result_page = value
          self
        end

        # Sets the property and returns this same instance.
        def with_split_payment_product_filters(value)
          @split_payment_product_filters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tokens(value)
          @tokens = value
          self
        end

        # Sets the property and returns this same instance.
        def with_variant(value)
          @variant = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['allowedNumberOfPaymentAttempts'] = @allowed_number_of_payment_attempts unless @allowed_number_of_payment_attempts.nil?
          hash['autoRefundSplitPayments'] = @auto_refund_split_payments unless @auto_refund_split_payments.nil?
          hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_h unless @card_payment_method_specific_input.nil?
          hash['isNewUnscheduledCardOnFileSeries'] = @is_new_unscheduled_card_on_file_series unless @is_new_unscheduled_card_on_file_series.nil?
          hash['isRecurring'] = @is_recurring unless @is_recurring.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['paymentProductFilters'] = @payment_product_filters.to_h unless @payment_product_filters.nil?
          hash['returnUrl'] = @return_url unless @return_url.nil?
          hash['sessionTimeout'] = @session_timeout unless @session_timeout.nil?
          hash['showResultPage'] = @show_result_page unless @show_result_page.nil?
          hash['splitPaymentProductFilters'] = @split_payment_product_filters.to_h unless @split_payment_product_filters.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash['variant'] = @variant unless @variant.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'allowedNumberOfPaymentAttempts'
            @allowed_number_of_payment_attempts = hash['allowedNumberOfPaymentAttempts']
          end
          if hash.key? 'autoRefundSplitPayments'
            @auto_refund_split_payments = hash['autoRefundSplitPayments']
          end
          if hash.key? 'cardPaymentMethodSpecificInput'
            raise TypeError, "value '#{hash['cardPaymentMethodSpecificInput']}' is not a Hash" unless hash['cardPaymentMethodSpecificInput'].is_a? Hash
            @card_payment_method_specific_input = OnlinePayments::SDK::Domain::CardPaymentMethodSpecificInputForHostedCheckout.new_from_hash(hash['cardPaymentMethodSpecificInput'])
          end
          if hash.key? 'isNewUnscheduledCardOnFileSeries'
            @is_new_unscheduled_card_on_file_series = hash['isNewUnscheduledCardOnFileSeries']
          end
          if hash.key? 'isRecurring'
            @is_recurring = hash['isRecurring']
          end
          if hash.key? 'locale'
            @locale = hash['locale']
          end
          if hash.key? 'paymentProductFilters'
            raise TypeError, "value '#{hash['paymentProductFilters']}' is not a Hash" unless hash['paymentProductFilters'].is_a? Hash
            @payment_product_filters = OnlinePayments::SDK::Domain::PaymentProductFiltersHostedCheckout.new_from_hash(hash['paymentProductFilters'])
          end
          if hash.key? 'returnUrl'
            @return_url = hash['returnUrl']
          end
          if hash.key? 'sessionTimeout'
            @session_timeout = hash['sessionTimeout']
          end
          if hash.key? 'showResultPage'
            @show_result_page = hash['showResultPage']
          end
          if hash.key? 'splitPaymentProductFilters'
            raise TypeError, "value '#{hash['splitPaymentProductFilters']}' is not a Hash" unless hash['splitPaymentProductFilters'].is_a? Hash
            @split_payment_product_filters = OnlinePayments::SDK::Domain::SplitPaymentProductFiltersHostedCheckout.new_from_hash(hash['splitPaymentProductFilters'])
          end
          if hash.key? 'tokens'
            @tokens = hash['tokens']
          end
          if hash.key? 'variant'
            @variant = hash['variant']
          end
        end
      end
    end
  end
end
