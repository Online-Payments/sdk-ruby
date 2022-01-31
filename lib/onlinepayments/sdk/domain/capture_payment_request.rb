#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_references'

module OnlinePayments::SDK
  module Domain

    # @attr [Long] amount
    # @attr [true/false] is_final
    # @attr [OnlinePayments::SDK::Domain::PaymentReferences] references
    class CapturePaymentRequest < OnlinePayments::SDK::DataObject
      attr_accessor :amount
      attr_accessor :is_final
      attr_accessor :references

      # @return (Hash)
      def to_h
        hash = super
        hash['amount'] = @amount unless @amount.nil?
        hash['isFinal'] = @is_final unless @is_final.nil?
        hash['references'] = @references.to_h if @references
        hash
      end

      def from_hash(hash)
        super
        @amount = hash['amount'] if hash.key? 'amount'
        @is_final = hash['isFinal'] if hash.key? 'isFinal'
        if hash.key? 'references'
          raise TypeError, "value '%s' is not a Hash" % [hash['references']] unless hash['references'].is_a? Hash
          @references = OnlinePayments::SDK::Domain::PaymentReferences.new_from_hash(hash['references'])
        end
      end
    end
  end
end
