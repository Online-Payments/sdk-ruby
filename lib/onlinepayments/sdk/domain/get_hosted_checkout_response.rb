#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/created_payment_output'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CreatedPaymentOutput] created_payment_output
    # @attr [String] status
    class GetHostedCheckoutResponse < OnlinePayments::SDK::DataObject
      attr_accessor :created_payment_output
      attr_accessor :status

      # @return (Hash)
      def to_h
        hash = super
        hash['createdPaymentOutput'] = @created_payment_output.to_h if @created_payment_output
        hash['status'] = @status unless @status.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'createdPaymentOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['createdPaymentOutput']] unless hash['createdPaymentOutput'].is_a? Hash
          @created_payment_output = OnlinePayments::SDK::Domain::CreatedPaymentOutput.new_from_hash(hash['createdPaymentOutput'])
        end
        @status = hash['status'] if hash.key? 'status'
      end
    end
  end
end
