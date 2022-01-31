#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] name
    class CompanyInformation < OnlinePayments::SDK::DataObject
      attr_accessor :name

      # @return (Hash)
      def to_h
        hash = super
        hash['name'] = @name unless @name.nil?
        hash
      end

      def from_hash(hash)
        super
        @name = hash['name'] if hash.key? 'name'
      end
    end
  end
end
