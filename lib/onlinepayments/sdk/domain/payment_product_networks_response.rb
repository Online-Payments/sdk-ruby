#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>] networks
      class PaymentProductNetworksResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :networks

        # @return (Hash)
        def to_h
          hash = super
          hash['networks'] = @networks unless @networks.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'networks'
            raise TypeError, "value '%s' is not an Array" % [hash['networks']] unless hash['networks'].is_a? Array
            @networks = []
            hash['networks'].each do |e|
              @networks << e
            end
          end
        end
      end
    end
  end
end
