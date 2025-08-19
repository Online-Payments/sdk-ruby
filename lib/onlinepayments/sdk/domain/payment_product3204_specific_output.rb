#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] banking_app_label
      class PaymentProduct3204SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :banking_app_label

        # @return (Hash)
        def to_h
          hash = super
          hash['bankingAppLabel'] = @banking_app_label unless @banking_app_label.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'bankingAppLabel'
            @banking_app_label = hash['bankingAppLabel']
          end
        end
      end
    end
  end
end
