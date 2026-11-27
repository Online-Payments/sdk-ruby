# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_payment_product840_customer_account'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::RefundPaymentProduct840CustomerAccount, nil] customer_account
      class RefundPaymentProduct840SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :customer_account

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(customer_account: nil)
          super()
          @customer_account = customer_account
        end

        # Sets the property and returns this same instance.
        def with_customer_account(value)
          @customer_account = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['customerAccount'] = @customer_account.to_h unless @customer_account.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'customerAccount'
            raise TypeError, "value '#{hash['customerAccount']}' is not a Hash" unless hash['customerAccount'].is_a? Hash
            @customer_account = OnlinePayments::SDK::Domain::RefundPaymentProduct840CustomerAccount.new_from_hash(hash['customerAccount'])
          end
        end
      end
    end
  end
end
