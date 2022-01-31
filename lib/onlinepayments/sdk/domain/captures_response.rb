#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/capture'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::Capture>] captures
    class CapturesResponse < OnlinePayments::SDK::DataObject
      attr_accessor :captures

      # @return (Hash)
      def to_h
        hash = super
        hash['captures'] = @captures.collect(&:to_h) if @captures
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'captures'
          raise TypeError, "value '%s' is not an Array" % [hash['captures']] unless hash['captures'].is_a? Array
          @captures = []
          hash['captures'].each do |e|
            @captures << OnlinePayments::SDK::Domain::Capture.new_from_hash(e)
          end
        end
      end
    end
  end
end
