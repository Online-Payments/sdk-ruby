# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] src_dpa_id
      # @attr [String, nil] src_initiator_id
      class PaymentProduct5002defaultBrandParameters < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :src_dpa_id

        attr_accessor :src_initiator_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(src_dpa_id: nil, src_initiator_id: nil)
          super()
          @src_dpa_id = src_dpa_id
          @src_initiator_id = src_initiator_id
        end

        # Sets the property and returns this same instance.
        def with_src_dpa_id(value)
          @src_dpa_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_src_initiator_id(value)
          @src_initiator_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['srcDpaId'] = @src_dpa_id unless @src_dpa_id.nil?
          hash['srcInitiatorId'] = @src_initiator_id unless @src_initiator_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'srcDpaId'
            @src_dpa_id = hash['srcDpaId']
          end
          if hash.key? 'srcInitiatorId'
            @src_initiator_id = hash['srcInitiatorId']
          end
        end
      end
    end
  end
end
