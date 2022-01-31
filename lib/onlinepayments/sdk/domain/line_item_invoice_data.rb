#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] description
    class LineItemInvoiceData < OnlinePayments::SDK::DataObject
      attr_accessor :description

      # @return (Hash)
      def to_h
        hash = super
        hash['description'] = @description unless @description.nil?
        hash
      end

      def from_hash(hash)
        super
        @description = hash['description'] if hash.key? 'description'
      end
    end
  end
end
