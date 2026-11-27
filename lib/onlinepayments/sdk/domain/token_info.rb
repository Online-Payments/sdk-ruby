# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] expiry_date
      # @attr [true/false, nil] is_temporary
      # @attr [String, nil] masked_pan
      # @attr [String, nil] token_id
      class TokenInfo < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expiry_date

        attr_accessor :is_temporary

        attr_accessor :masked_pan

        attr_accessor :token_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(expiry_date: nil, is_temporary: nil, masked_pan: nil, token_id: nil)
          super()
          @expiry_date = expiry_date
          @is_temporary = is_temporary
          @masked_pan = masked_pan
          @token_id = token_id
        end

        # Sets the property and returns this same instance.
        def with_expiry_date(value)
          @expiry_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_temporary(value)
          @is_temporary = value
          self
        end

        # Sets the property and returns this same instance.
        def with_masked_pan(value)
          @masked_pan = value
          self
        end

        # Sets the property and returns this same instance.
        def with_token_id(value)
          @token_id = value
          self
        end

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
          if hash.key? 'expiryDate'
            @expiry_date = hash['expiryDate']
          end
          if hash.key? 'isTemporary'
            @is_temporary = hash['isTemporary']
          end
          if hash.key? 'maskedPan'
            @masked_pan = hash['maskedPan']
          end
          if hash.key? 'tokenId'
            @token_id = hash['tokenId']
          end
        end
      end
    end
  end
end
