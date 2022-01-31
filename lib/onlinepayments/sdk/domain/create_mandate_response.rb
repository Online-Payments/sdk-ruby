#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/mandate_merchant_action'
require 'onlinepayments/sdk/domain/mandate_response'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::MandateResponse] mandate
    # @attr [OnlinePayments::SDK::Domain::MandateMerchantAction] merchant_action
    class CreateMandateResponse < OnlinePayments::SDK::DataObject
      attr_accessor :mandate
      attr_accessor :merchant_action

      # @return (Hash)
      def to_h
        hash = super
        hash['mandate'] = @mandate.to_h if @mandate
        hash['merchantAction'] = @merchant_action.to_h if @merchant_action
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'mandate'
          raise TypeError, "value '%s' is not a Hash" % [hash['mandate']] unless hash['mandate'].is_a? Hash
          @mandate = OnlinePayments::SDK::Domain::MandateResponse.new_from_hash(hash['mandate'])
        end
        if hash.key? 'merchantAction'
          raise TypeError, "value '%s' is not a Hash" % [hash['merchantAction']] unless hash['merchantAction'].is_a? Hash
          @merchant_action = OnlinePayments::SDK::Domain::MandateMerchantAction.new_from_hash(hash['merchantAction'])
        end
      end
    end
  end
end
