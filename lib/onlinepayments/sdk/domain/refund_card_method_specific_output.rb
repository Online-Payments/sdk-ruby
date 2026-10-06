#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/acceptance'
require 'onlinepayments/sdk/domain/currency_conversion'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/reattempt_instructions'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Acceptance, nil] acceptance
      # @attr [String, nil] authorisation_code
      # @attr [OnlinePayments::SDK::Domain::CurrencyConversion, nil] currency_conversion
      # @attr [OnlinePayments::SDK::Domain::ReattemptInstructions, nil] reattempt_instructions
      # @attr [Integer, nil] total_amount_paid
      # @attr [Integer, nil] total_amount_refunded
      class RefundCardMethodSpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acceptance

        attr_accessor :authorisation_code

        attr_accessor :currency_conversion

        attr_accessor :reattempt_instructions

        attr_accessor :total_amount_paid

        attr_accessor :total_amount_refunded

        # Sets the property and returns this same instance.
        def with_acceptance(value)
          @acceptance = value
          self
        end

        # Sets the property and returns this same instance.
        def with_authorisation_code(value)
          @authorisation_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_currency_conversion(value)
          @currency_conversion = value
          self
        end

        # Sets the property and returns this same instance.
        def with_reattempt_instructions(value)
          @reattempt_instructions = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_amount_paid(value)
          @total_amount_paid = value
          self
        end

        # Sets the property and returns this same instance.
        def with_total_amount_refunded(value)
          @total_amount_refunded = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acceptance'] = @acceptance.to_h unless @acceptance.nil?
          hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
          hash['currencyConversion'] = @currency_conversion.to_h unless @currency_conversion.nil?
          hash['reattemptInstructions'] = @reattempt_instructions.to_h unless @reattempt_instructions.nil?
          hash['totalAmountPaid'] = @total_amount_paid unless @total_amount_paid.nil?
          hash['totalAmountRefunded'] = @total_amount_refunded unless @total_amount_refunded.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acceptance'
            raise TypeError, "value '%s' is not a Hash" % [hash['acceptance']] unless hash['acceptance'].is_a? Hash
            @acceptance = OnlinePayments::SDK::Domain::Acceptance.new_from_hash(hash['acceptance'])
          end
          if hash.has_key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.has_key? 'currencyConversion'
            raise TypeError, "value '%s' is not a Hash" % [hash['currencyConversion']] unless hash['currencyConversion'].is_a? Hash
            @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversion.new_from_hash(hash['currencyConversion'])
          end
          if hash.has_key? 'reattemptInstructions'
            raise TypeError, "value '%s' is not a Hash" % [hash['reattemptInstructions']] unless hash['reattemptInstructions'].is_a? Hash
            @reattempt_instructions = OnlinePayments::SDK::Domain::ReattemptInstructions.new_from_hash(hash['reattemptInstructions'])
          end
          if hash.has_key? 'totalAmountPaid'
            @total_amount_paid = hash['totalAmountPaid']
          end
          if hash.has_key? 'totalAmountRefunded'
            @total_amount_refunded = hash['totalAmountRefunded']
          end
        end
      end
    end
  end
end
