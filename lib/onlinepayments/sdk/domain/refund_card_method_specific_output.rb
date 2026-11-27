# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acceptance: nil,
                       authorisation_code: nil,
                       currency_conversion: nil,
                       reattempt_instructions: nil,
                       total_amount_paid: nil,
                       total_amount_refunded: nil)
          super()
          @acceptance = acceptance
          @authorisation_code = authorisation_code
          @currency_conversion = currency_conversion
          @reattempt_instructions = reattempt_instructions
          @total_amount_paid = total_amount_paid
          @total_amount_refunded = total_amount_refunded
        end

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
          if hash.key? 'acceptance'
            raise TypeError, "value '#{hash['acceptance']}' is not a Hash" unless hash['acceptance'].is_a? Hash
            @acceptance = OnlinePayments::SDK::Domain::Acceptance.new_from_hash(hash['acceptance'])
          end
          if hash.key? 'authorisationCode'
            @authorisation_code = hash['authorisationCode']
          end
          if hash.key? 'currencyConversion'
            raise TypeError, "value '#{hash['currencyConversion']}' is not a Hash" unless hash['currencyConversion'].is_a? Hash
            @currency_conversion = OnlinePayments::SDK::Domain::CurrencyConversion.new_from_hash(hash['currencyConversion'])
          end
          if hash.key? 'reattemptInstructions'
            raise TypeError, "value '#{hash['reattemptInstructions']}' is not a Hash" unless hash['reattemptInstructions'].is_a? Hash
            @reattempt_instructions = OnlinePayments::SDK::Domain::ReattemptInstructions.new_from_hash(hash['reattemptInstructions'])
          end
          if hash.key? 'totalAmountPaid'
            @total_amount_paid = hash['totalAmountPaid']
          end
          if hash.key? 'totalAmountRefunded'
            @total_amount_refunded = hash['totalAmountRefunded']
          end
        end
      end
    end
  end
end
