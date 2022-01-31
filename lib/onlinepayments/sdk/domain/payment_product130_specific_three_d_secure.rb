#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] acquirer_exemption
    # @attr [String] merchant_score
    # @attr [Integer] number_of_items
    # @attr [String] usecase
    class PaymentProduct130SpecificThreeDSecure < OnlinePayments::SDK::DataObject
      attr_accessor :acquirer_exemption
      attr_accessor :merchant_score
      attr_accessor :number_of_items
      attr_accessor :usecase

      # @return (Hash)
      def to_h
        hash = super
        hash['acquirerExemption'] = @acquirer_exemption unless @acquirer_exemption.nil?
        hash['merchantScore'] = @merchant_score unless @merchant_score.nil?
        hash['numberOfItems'] = @number_of_items unless @number_of_items.nil?
        hash['usecase'] = @usecase unless @usecase.nil?
        hash
      end

      def from_hash(hash)
        super
        @acquirer_exemption = hash['acquirerExemption'] if hash.key? 'acquirerExemption'
        @merchant_score = hash['merchantScore'] if hash.key? 'merchantScore'
        @number_of_items = hash['numberOfItems'] if hash.key? 'numberOfItems'
        @usecase = hash['usecase'] if hash.key? 'usecase'
      end
    end
  end
end
