#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] return_url
    class RedirectionData < OnlinePayments::SDK::DataObject
      attr_accessor :return_url

      # @return (Hash)
      def to_h
        hash = super
        hash['returnUrl'] = @return_url unless @return_url.nil?
        hash
      end

      def from_hash(hash)
        super
        @return_url = hash['returnUrl'] if hash.key? 'returnUrl'
      end
    end
  end
end
