# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false, nil] force_authentication
      # @attr [true/false, nil] is_deferred_payment
      # @attr [true/false, nil] is_wip_transaction
      # @attr [String, nil] wip_merchant_authentication_method
      class PaymentProduct3012SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :force_authentication

        attr_accessor :is_deferred_payment

        attr_accessor :is_wip_transaction

        attr_accessor :wip_merchant_authentication_method

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(force_authentication: nil, is_deferred_payment: nil, is_wip_transaction: nil, wip_merchant_authentication_method: nil)
          super()
          @force_authentication = force_authentication
          @is_deferred_payment = is_deferred_payment
          @is_wip_transaction = is_wip_transaction
          @wip_merchant_authentication_method = wip_merchant_authentication_method
        end

        # Sets the property and returns this same instance.
        def with_force_authentication(value)
          @force_authentication = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_deferred_payment(value)
          @is_deferred_payment = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_wip_transaction(value)
          @is_wip_transaction = value
          self
        end

        # Sets the property and returns this same instance.
        def with_wip_merchant_authentication_method(value)
          @wip_merchant_authentication_method = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['forceAuthentication'] = @force_authentication unless @force_authentication.nil?
          hash['isDeferredPayment'] = @is_deferred_payment unless @is_deferred_payment.nil?
          hash['isWipTransaction'] = @is_wip_transaction unless @is_wip_transaction.nil?
          hash['wipMerchantAuthenticationMethod'] = @wip_merchant_authentication_method unless @wip_merchant_authentication_method.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'forceAuthentication'
            @force_authentication = hash['forceAuthentication']
          end
          if hash.key? 'isDeferredPayment'
            @is_deferred_payment = hash['isDeferredPayment']
          end
          if hash.key? 'isWipTransaction'
            @is_wip_transaction = hash['isWipTransaction']
          end
          if hash.key? 'wipMerchantAuthenticationMethod'
            @wip_merchant_authentication_method = hash['wipMerchantAuthenticationMethod']
          end
        end
      end
    end
  end
end
