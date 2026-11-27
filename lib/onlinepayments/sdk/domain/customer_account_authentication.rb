# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] data
      # @attr [String, nil] method
      # @attr [String, nil] utc_timestamp
      class CustomerAccountAuthentication < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :data

        attr_accessor :method

        attr_accessor :utc_timestamp

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(data: nil, method: nil, utc_timestamp: nil)
          super()
          @data = data
          @method = method
          @utc_timestamp = utc_timestamp
        end

        # Sets the property and returns this same instance.
        def with_data(value)
          @data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_method(value)
          @method = value
          self
        end

        # Sets the property and returns this same instance.
        def with_utc_timestamp(value)
          @utc_timestamp = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['data'] = @data unless @data.nil?
          hash['method'] = @method unless @method.nil?
          hash['utcTimestamp'] = @utc_timestamp unless @utc_timestamp.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'data'
            @data = hash['data']
          end
          if hash.key? 'method'
            @method = hash['method']
          end
          if hash.key? 'utcTimestamp'
            @utc_timestamp = hash['utcTimestamp']
          end
        end
      end
    end
  end
end
