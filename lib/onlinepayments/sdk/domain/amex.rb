# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/dpa_data'
require 'onlinepayments/sdk/domain/dpa_transaction_options'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::DpaData, nil] dpa_data
      # @attr [OnlinePayments::SDK::Domain::DpaTransactionOptions, nil] dpa_transaction_options
      # @attr [String, nil] src_initiator_id
      class Amex < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :dpa_data

        attr_accessor :dpa_transaction_options

        attr_accessor :src_initiator_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(dpa_data: nil, dpa_transaction_options: nil, src_initiator_id: nil)
          super()
          @dpa_data = dpa_data
          @dpa_transaction_options = dpa_transaction_options
          @src_initiator_id = src_initiator_id
        end

        # Sets the property and returns this same instance.
        def with_dpa_data(value)
          @dpa_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_dpa_transaction_options(value)
          @dpa_transaction_options = value
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
          hash['dpaData'] = @dpa_data.to_h unless @dpa_data.nil?
          hash['dpaTransactionOptions'] = @dpa_transaction_options.to_h unless @dpa_transaction_options.nil?
          hash['srcInitiatorId'] = @src_initiator_id unless @src_initiator_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'dpaData'
            raise TypeError, "value '#{hash['dpaData']}' is not a Hash" unless hash['dpaData'].is_a? Hash
            @dpa_data = OnlinePayments::SDK::Domain::DpaData.new_from_hash(hash['dpaData'])
          end
          if hash.key? 'dpaTransactionOptions'
            raise TypeError, "value '#{hash['dpaTransactionOptions']}' is not a Hash" unless hash['dpaTransactionOptions'].is_a? Hash
            @dpa_transaction_options = OnlinePayments::SDK::Domain::DpaTransactionOptions.new_from_hash(hash['dpaTransactionOptions'])
          end
          if hash.key? 'srcInitiatorId'
            @src_initiator_id = hash['srcInitiatorId']
          end
        end
      end
    end
  end
end
