#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/mandate_response'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::MandateResponse] mandate
    class GetMandateResponse < OnlinePayments::SDK::DataObject
      attr_accessor :mandate

      # @return (Hash)
      def to_h
        hash = super
        hash['mandate'] = @mandate.to_h if @mandate
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'mandate'
          raise TypeError, "value '%s' is not a Hash" % [hash['mandate']] unless hash['mandate'].is_a? Hash
          @mandate = OnlinePayments::SDK::Domain::MandateResponse.new_from_hash(hash['mandate'])
        end
      end
    end
  end
end
