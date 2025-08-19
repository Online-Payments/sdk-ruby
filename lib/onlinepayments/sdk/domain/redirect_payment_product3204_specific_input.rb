#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] alias_label
      # @attr [String] blik_code
      class RedirectPaymentProduct3204SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :alias_label

        attr_accessor :blik_code

        # @return (Hash)
        def to_h
          hash = super
          hash['aliasLabel'] = @alias_label unless @alias_label.nil?
          hash['blikCode'] = @blik_code unless @blik_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'aliasLabel'
            @alias_label = hash['aliasLabel']
          end
          if hash.has_key? 'blikCode'
            @blik_code = hash['blikCode']
          end
        end
      end
    end
  end
end
