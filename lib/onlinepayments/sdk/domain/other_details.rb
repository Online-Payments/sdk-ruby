# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] meta_data
      # @attr [String, nil] travel_data
      class OtherDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :meta_data

        attr_accessor :travel_data

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(meta_data: nil, travel_data: nil)
          super()
          @meta_data = meta_data
          @travel_data = travel_data
        end

        # Sets the property and returns this same instance.
        def with_meta_data(value)
          @meta_data = value
          self
        end

        # Sets the property and returns this same instance.
        def with_travel_data(value)
          @travel_data = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['metaData'] = @meta_data unless @meta_data.nil?
          hash['travelData'] = @travel_data unless @travel_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'metaData'
            @meta_data = hash['metaData']
          end
          if hash.key? 'travelData'
            @travel_data = hash['travelData']
          end
        end
      end
    end
  end
end
