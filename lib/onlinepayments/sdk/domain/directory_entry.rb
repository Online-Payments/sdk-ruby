#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] issuer_id
    # @attr [String] issuer_list
    # @attr [String] issuer_name
    class DirectoryEntry < OnlinePayments::SDK::DataObject
      attr_accessor :issuer_id
      attr_accessor :issuer_list
      attr_accessor :issuer_name

      # @return (Hash)
      def to_h
        hash = super
        hash['issuerId'] = @issuer_id unless @issuer_id.nil?
        hash['issuerList'] = @issuer_list unless @issuer_list.nil?
        hash['issuerName'] = @issuer_name unless @issuer_name.nil?
        hash
      end

      def from_hash(hash)
        super
        @issuer_id = hash['issuerId'] if hash.key? 'issuerId'
        @issuer_list = hash['issuerList'] if hash.key? 'issuerList'
        @issuer_name = hash['issuerName'] if hash.key? 'issuerName'
      end
    end
  end
end
