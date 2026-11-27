# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/token_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::TokenData, nil] data
      class TokenCardSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(data: nil)
          super()
          @data = data
        end

        # Sets the property and returns this same instance.
        def with_data(value)
          @data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['data'] = @data.to_h unless @data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'data'
            raise TypeError, "value '#{hash['data']}' is not a Hash" unless hash['data'].is_a? Hash
            @data = OnlinePayments::SDK::Domain::TokenData.new_from_hash(hash['data'])
          end
        end
      end
    end
  end
end
