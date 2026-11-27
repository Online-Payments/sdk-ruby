# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_card_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] alias
      # @attr [OnlinePayments::SDK::Domain::TokenCardData, nil] data
      class TokenCard < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :alias

        attr_accessor :data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(alias: nil, data: nil)
          super()
          @alias = binding.local_variable_get(:alias)
          @data = data
        end

        # Sets the property and returns this same instance.
        def with_alias(value)
          @alias = value
          self
        end

        # Sets the property and returns this same instance.
        def with_data(value)
          @data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['alias'] = @alias unless @alias.nil?
          hash['data'] = @data.to_h unless @data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'alias'
            @alias = hash['alias']
          end
          if hash.key? 'data'
            raise TypeError, "value '#{hash['data']}' is not a Hash" unless hash['data'].is_a? Hash
            @data = OnlinePayments::SDK::Domain::TokenCardData.new_from_hash(hash['data'])
          end
        end
      end
    end
  end
end
