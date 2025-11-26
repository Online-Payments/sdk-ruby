#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product3012'
require 'onlinepayments/sdk/domain/payment_product350'
require 'onlinepayments/sdk/domain/payment_product5001'
require 'onlinepayments/sdk/domain/payment_product5404'
require 'onlinepayments/sdk/domain/payment_product5407'
require 'onlinepayments/sdk/domain/pending_authentication'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct3012] payment_product3012
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct350] payment_product350
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5001] payment_product5001
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5404] payment_product5404
      # @attr [OnlinePayments::SDK::Domain::PaymentProduct5407] payment_product5407
      # @attr [OnlinePayments::SDK::Domain::PendingAuthentication] pending_authentication
      class ShowFormData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_product3012

        attr_accessor :payment_product350

        attr_accessor :payment_product5001

        attr_accessor :payment_product5404

        attr_accessor :payment_product5407

        attr_accessor :pending_authentication

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentProduct3012'] = @payment_product3012.to_h unless @payment_product3012.nil?
          hash['paymentProduct350'] = @payment_product350.to_h unless @payment_product350.nil?
          hash['paymentProduct5001'] = @payment_product5001.to_h unless @payment_product5001.nil?
          hash['paymentProduct5404'] = @payment_product5404.to_h unless @payment_product5404.nil?
          hash['paymentProduct5407'] = @payment_product5407.to_h unless @payment_product5407.nil?
          hash['pendingAuthentication'] = @pending_authentication.to_h unless @pending_authentication.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentProduct3012'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3012']] unless hash['paymentProduct3012'].is_a? Hash
            @payment_product3012 = OnlinePayments::SDK::Domain::PaymentProduct3012.new_from_hash(hash['paymentProduct3012'])
          end
          if hash.has_key? 'paymentProduct350'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct350']] unless hash['paymentProduct350'].is_a? Hash
            @payment_product350 = OnlinePayments::SDK::Domain::PaymentProduct350.new_from_hash(hash['paymentProduct350'])
          end
          if hash.has_key? 'paymentProduct5001'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5001']] unless hash['paymentProduct5001'].is_a? Hash
            @payment_product5001 = OnlinePayments::SDK::Domain::PaymentProduct5001.new_from_hash(hash['paymentProduct5001'])
          end
          if hash.has_key? 'paymentProduct5404'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5404']] unless hash['paymentProduct5404'].is_a? Hash
            @payment_product5404 = OnlinePayments::SDK::Domain::PaymentProduct5404.new_from_hash(hash['paymentProduct5404'])
          end
          if hash.has_key? 'paymentProduct5407'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5407']] unless hash['paymentProduct5407'].is_a? Hash
            @payment_product5407 = OnlinePayments::SDK::Domain::PaymentProduct5407.new_from_hash(hash['paymentProduct5407'])
          end
          if hash.has_key? 'pendingAuthentication'
            raise TypeError, "value '%s' is not a Hash" % [hash['pendingAuthentication']] unless hash['pendingAuthentication'].is_a? Hash
            @pending_authentication = OnlinePayments::SDK::Domain::PendingAuthentication.new_from_hash(hash['pendingAuthentication'])
          end
        end
      end
    end
  end
end
