#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] issuer_id
      # @attr [String] issuer_list
      # @attr [String] issuer_name
      class DirectoryEntry < OnlinePayments::SDK::Domain::DataObject

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
          if hash.has_key? 'issuerId'
            @issuer_id = hash['issuerId']
          end
          if hash.has_key? 'issuerList'
            @issuer_list = hash['issuerList']
          end
          if hash.has_key? 'issuerName'
            @issuer_name = hash['issuerName']
          end
        end
      end
    end
  end
end
