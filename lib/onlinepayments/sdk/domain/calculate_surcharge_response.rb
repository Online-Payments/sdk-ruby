# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/surcharge'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::Surcharge>, nil] surcharges
      class CalculateSurchargeResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :surcharges

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(surcharges: nil)
          super()
          @surcharges = surcharges
        end

        # Sets the property and returns this same instance.
        def with_surcharges(value)
          @surcharges = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['surcharges'] = @surcharges.collect{|val| val.to_h} unless @surcharges.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'surcharges'
            raise TypeError, "value '#{hash['surcharges']}' is not an Array" unless hash['surcharges'].is_a? Array
            @surcharges = []
            hash['surcharges'].each do |e|
              @surcharges << OnlinePayments::SDK::Domain::Surcharge.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
