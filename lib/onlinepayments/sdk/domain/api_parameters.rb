# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/amex'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mastercard'
require 'onlinepayments/sdk/domain/payment_product5002default_brand_parameters'
require 'onlinepayments/sdk/domain/visa'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::Amex, nil] amex
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5002defaultBrandParameters, nil] cb
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5002defaultBrandParameters, nil] eftpos
      # @attr [OnlinePayments::SDK::Domain::Mastercard, nil] mastercard
      # @attr [OnlinePayments::SDK::Domain::Visa, nil] visa
      class ApiParameters < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amex

        attr_accessor :cb

        attr_accessor :eftpos

        attr_accessor :mastercard

        attr_accessor :visa

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(amex: nil, cb: nil, eftpos: nil, mastercard: nil, visa: nil)
          super()
          @amex = amex
          @cb = cb
          @eftpos = eftpos
          @mastercard = mastercard
          @visa = visa
        end

        # Sets the property and returns this same instance.
        def with_amex(value)
          @amex = value
          self
        end

        # Sets the property and returns this same instance.
        def with_cb(value)
          @cb = value
          self
        end

        # Sets the property and returns this same instance.
        def with_eftpos(value)
          @eftpos = value
          self
        end

        # Sets the property and returns this same instance.
        def with_mastercard(value)
          @mastercard = value
          self
        end

        # Sets the property and returns this same instance.
        def with_visa(value)
          @visa = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amex'] = @amex.to_h unless @amex.nil?
          hash['cb'] = @cb.to_h unless @cb.nil?
          hash['eftpos'] = @eftpos.to_h unless @eftpos.nil?
          hash['mastercard'] = @mastercard.to_h unless @mastercard.nil?
          hash['visa'] = @visa.to_h unless @visa.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'amex'
            raise TypeError, "value '#{hash['amex']}' is not a Hash" unless hash['amex'].is_a? Hash
            @amex = OnlinePayments::SDK::Domain::Amex.new_from_hash(hash['amex'])
          end
          if hash.key? 'cb'
            raise TypeError, "value '#{hash['cb']}' is not a Hash" unless hash['cb'].is_a? Hash
            @cb = OnlinePayments::SDK::Domain::PaymentProduct5002defaultBrandParameters.new_from_hash(hash['cb'])
          end
          if hash.key? 'eftpos'
            raise TypeError, "value '#{hash['eftpos']}' is not a Hash" unless hash['eftpos'].is_a? Hash
            @eftpos = OnlinePayments::SDK::Domain::PaymentProduct5002defaultBrandParameters.new_from_hash(hash['eftpos'])
          end
          if hash.key? 'mastercard'
            raise TypeError, "value '#{hash['mastercard']}' is not a Hash" unless hash['mastercard'].is_a? Hash
            @mastercard = OnlinePayments::SDK::Domain::Mastercard.new_from_hash(hash['mastercard'])
          end
          if hash.key? 'visa'
            raise TypeError, "value '#{hash['visa']}' is not a Hash" unless hash['visa'].is_a? Hash
            @visa = OnlinePayments::SDK::Domain::Visa.new_from_hash(hash['visa'])
          end
        end
      end
    end
  end
end
