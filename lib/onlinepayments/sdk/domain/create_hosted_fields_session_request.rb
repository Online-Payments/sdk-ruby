#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] locale
      class CreateHostedFieldsSessionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :locale

        # @return (Hash)
        def to_h
          hash = super
          hash['locale'] = @locale unless @locale.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
        end
      end
    end
  end
end
