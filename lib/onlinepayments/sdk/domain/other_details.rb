#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] meta_data
      # @attr [String] travel_data
      class OtherDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :meta_data

        attr_accessor :travel_data

        # @return (Hash)
        def to_h
          hash = super
          hash['metaData'] = @meta_data unless @meta_data.nil?
          hash['travelData'] = @travel_data unless @travel_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'metaData'
            @meta_data = hash['metaData']
          end
          if hash.has_key? 'travelData'
            @travel_data = hash['travelData']
          end
        end
      end
    end
  end
end
