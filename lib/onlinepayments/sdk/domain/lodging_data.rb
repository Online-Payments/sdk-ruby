# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] check_in_date
      class LodgingData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :check_in_date

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(check_in_date: nil)
          super()
          @check_in_date = check_in_date
        end

        # Sets the property and returns this same instance.
        def with_check_in_date(value)
          @check_in_date = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['checkInDate'] = @check_in_date unless @check_in_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'checkInDate'
            @check_in_date = hash['checkInDate']
          end
        end
      end
    end
  end
end
