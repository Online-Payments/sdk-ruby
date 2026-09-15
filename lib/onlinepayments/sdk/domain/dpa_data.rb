#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] dpa_name
      class DpaData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dpa_name

        # @return (Hash)
        def to_h
          hash = super
          hash['dpaName'] = @dpa_name unless @dpa_name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'dpaName'
            @dpa_name = hash['dpaName']
          end
        end
      end
    end
  end
end
