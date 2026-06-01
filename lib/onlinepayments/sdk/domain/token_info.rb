#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] expiry_date
      # @attr [true/false] is_temporary
      # @attr [String] masked_pan
      # @attr [String] token_id
      class TokenInfo < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expiry_date

        attr_accessor :is_temporary

        attr_accessor :masked_pan

        attr_accessor :token_id

        # @return (Hash)
        def to_h
          hash = super
          hash['expiryDate'] = @expiry_date unless @expiry_date.nil?
          hash['isTemporary'] = @is_temporary unless @is_temporary.nil?
          hash['maskedPan'] = @masked_pan unless @masked_pan.nil?
          hash['tokenId'] = @token_id unless @token_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
          if hash.has_key? 'isTemporary'
            @is_temporary = hash['isTemporary']
          end
          if hash.has_key? 'maskedPan'
            @masked_pan = hash['maskedPan']
          end
          if hash.has_key? 'tokenId'
            @token_id = hash['tokenId']
          end
        end
      end
    end
  end
end
