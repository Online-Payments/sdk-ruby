#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/surcharge'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::Surcharge>] surcharges
    class CalculateSurchargeResponse < OnlinePayments::SDK::DataObject
      attr_accessor :surcharges

      # @return (Hash)
      def to_h
        hash = super
        hash['surcharges'] = @surcharges.collect(&:to_h) if @surcharges
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'surcharges'
          raise TypeError, "value '%s' is not an Array" % [hash['surcharges']] unless hash['surcharges'].is_a? Array
          @surcharges = []
          hash['surcharges'].each do |e|
            @surcharges << OnlinePayments::SDK::Domain::Surcharge.new_from_hash(e)
          end
        end
      end
    end
  end
end
