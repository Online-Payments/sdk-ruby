#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_merchant_action'
require 'onlinepayments/sdk/domain/mandate_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::MandateResponse] mandate
      # @attr [OnlinePayments::SDK::Domain::MandateMerchantAction] merchant_action
      class CreateMandateResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mandate

        attr_accessor :merchant_action

        # @return (Hash)
        def to_h
          hash = super
          hash['mandate'] = @mandate.to_h unless @mandate.nil?
          hash['merchantAction'] = @merchant_action.to_h unless @merchant_action.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'mandate'
            raise TypeError, "value '%s' is not a Hash" % [hash['mandate']] unless hash['mandate'].is_a? Hash
            @mandate = OnlinePayments::SDK::Domain::MandateResponse.new_from_hash(hash['mandate'])
          end
          if hash.has_key? 'merchantAction'
            raise TypeError, "value '%s' is not a Hash" % [hash['merchantAction']] unless hash['merchantAction'].is_a? Hash
            @merchant_action = OnlinePayments::SDK::Domain::MandateMerchantAction.new_from_hash(hash['merchantAction'])
          end
        end
      end
    end
  end
end
