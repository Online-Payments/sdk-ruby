# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>, nil] networks
      class PaymentProduct302SpecificData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :networks

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(networks: nil)
          super()
          @networks = networks
        end

        # Sets the property and returns this same instance.
        def with_networks(value)
          @networks = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['networks'] = @networks unless @networks.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'networks'
            raise TypeError, "value '#{hash['networks']}' is not an Array" unless hash['networks'].is_a? Array
            @networks = []
            hash['networks'].each do |e|
              @networks << e
            end
          end
        end
      end
    end
  end
end
