# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] acs_reference_number
      # @attr [String, nil] acs_signed_content
      # @attr [String, nil] acs_transaction_id
      # @attr [String, nil] three_d_server_transaction_id
      class MobileThreeDSecureChallengeParameters < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acs_reference_number

        attr_accessor :acs_signed_content

        attr_accessor :acs_transaction_id

        attr_accessor :three_d_server_transaction_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acs_reference_number: nil, acs_signed_content: nil, acs_transaction_id: nil, three_d_server_transaction_id: nil)
          super()
          @acs_reference_number = acs_reference_number
          @acs_signed_content = acs_signed_content
          @acs_transaction_id = acs_transaction_id
          @three_d_server_transaction_id = three_d_server_transaction_id
        end

        # Sets the property and returns this same instance.
        def with_acs_reference_number(value)
          @acs_reference_number = value
          self
        end

        # Sets the property and returns this same instance.
        def with_acs_signed_content(value)
          @acs_signed_content = value
          self
        end

        # Sets the property and returns this same instance.
        def with_acs_transaction_id(value)
          @acs_transaction_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_three_d_server_transaction_id(value)
          @three_d_server_transaction_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acsReferenceNumber'] = @acs_reference_number unless @acs_reference_number.nil?
          hash['acsSignedContent'] = @acs_signed_content unless @acs_signed_content.nil?
          hash['acsTransactionId'] = @acs_transaction_id unless @acs_transaction_id.nil?
          hash['threeDServerTransactionId'] = @three_d_server_transaction_id unless @three_d_server_transaction_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acsReferenceNumber'
            @acs_reference_number = hash['acsReferenceNumber']
          end
          if hash.key? 'acsSignedContent'
            @acs_signed_content = hash['acsSignedContent']
          end
          if hash.key? 'acsTransactionId'
            @acs_transaction_id = hash['acsTransactionId']
          end
          if hash.key? 'threeDServerTransactionId'
            @three_d_server_transaction_id = hash['threeDServerTransactionId']
          end
        end
      end
    end
  end
end
