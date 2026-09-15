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
          if hash.has_key? 'dpaData'
            raise TypeError, "value '%s' is not a Hash" % [hash['dpaData']] unless hash['dpaData'].is_a? Hash
            @dpa_data = OnlinePayments::SDK::Domain::DpaData.new_from_hash(hash['dpaData'])
          end
          if hash.has_key? 'dpaTransactionOptions'
            raise TypeError, "value '%s' is not a Hash" % [hash['dpaTransactionOptions']] unless hash['dpaTransactionOptions'].is_a? Hash
            @dpa_transaction_options = OnlinePayments::SDK::Domain::DpaTransactionOptions.new_from_hash(hash['dpaTransactionOptions'])
          end
          if hash.has_key? 'srcInitiatorId'
            @src_initiator_id = hash['srcInitiatorId']
          end
        end
      end
    end
  end
end
