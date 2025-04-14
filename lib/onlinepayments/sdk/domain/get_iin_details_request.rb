#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_context'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] bin
      # @attr [OnlinePayments::SDK::Domain::PaymentContext] payment_context
      class GetIINDetailsRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :bin

        attr_accessor :payment_context

        # @return (Hash)
        def to_h
          hash = super
          hash['bin'] = @bin unless @bin.nil?
          hash['paymentContext'] = @payment_context.to_h unless @payment_context.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'bin'
            @bin = hash['bin']
          end
          if hash.has_key? 'paymentContext'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentContext']] unless hash['paymentContext'].is_a? Hash
            @payment_context = OnlinePayments::SDK::Domain::PaymentContext.new_from_hash(hash['paymentContext'])
          end
        end
      end
    end
  end
end
