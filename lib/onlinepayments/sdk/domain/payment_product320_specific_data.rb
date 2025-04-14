#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] gateway
      # @attr [Array<String>] networks
      class PaymentProduct320SpecificData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :gateway

        attr_accessor :networks

        # @return (Hash)
        def to_h
          hash = super
          hash['gateway'] = @gateway unless @gateway.nil?
          hash['networks'] = @networks unless @networks.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'gateway'
            @gateway = hash['gateway']
          end
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
