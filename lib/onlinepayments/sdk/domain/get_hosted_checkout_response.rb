#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/created_payment_output'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CreatedPaymentOutput] created_payment_output
      # @attr [String] status
      class GetHostedCheckoutResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :created_payment_output

        attr_accessor :status

        # @return (Hash)
        def to_h
          hash = super
          hash['createdPaymentOutput'] = @created_payment_output.to_h unless @created_payment_output.nil?
          hash['status'] = @status unless @status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'createdPaymentOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['createdPaymentOutput']] unless hash['createdPaymentOutput'].is_a? Hash
            @created_payment_output = OnlinePayments::SDK::Domain::CreatedPaymentOutput.new_from_hash(hash['createdPaymentOutput'])
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
        end
      end
    end
  end
end
