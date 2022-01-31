#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] gateway
    # @attr [Array<String>] networks
    class PaymentProduct320SpecificData < OnlinePayments::SDK::DataObject
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
        @gateway = hash['gateway'] if hash.key? 'gateway'
        if hash.key? 'networks'
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
