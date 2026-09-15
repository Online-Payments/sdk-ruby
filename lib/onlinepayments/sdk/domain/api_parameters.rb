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
          if hash.has_key? 'amex'
            raise TypeError, "value '%s' is not a Hash" % [hash['amex']] unless hash['amex'].is_a? Hash
            @amex = OnlinePayments::SDK::Domain::Amex.new_from_hash(hash['amex'])
          end
          if hash.has_key? 'cb'
            raise TypeError, "value '%s' is not a Hash" % [hash['cb']] unless hash['cb'].is_a? Hash
            @cb = OnlinePayments::SDK::Domain::PaymentProduct5002defaultBrandParameters.new_from_hash(hash['cb'])
          end
          if hash.has_key? 'eftpos'
            raise TypeError, "value '%s' is not a Hash" % [hash['eftpos']] unless hash['eftpos'].is_a? Hash
            @eftpos = OnlinePayments::SDK::Domain::PaymentProduct5002defaultBrandParameters.new_from_hash(hash['eftpos'])
          end
          if hash.has_key? 'mastercard'
            raise TypeError, "value '%s' is not a Hash" % [hash['mastercard']] unless hash['mastercard'].is_a? Hash
            @mastercard = OnlinePayments::SDK::Domain::Mastercard.new_from_hash(hash['mastercard'])
          end
          if hash.has_key? 'visa'
            raise TypeError, "value '%s' is not a Hash" % [hash['visa']] unless hash['visa'].is_a? Hash
            @visa = OnlinePayments::SDK::Domain::Visa.new_from_hash(hash['visa'])
          end
        end
      end
    end
  end
end
