# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<Integer>, nil] exclude
      # @attr [Array<Integer>, nil] restrict_to
      class PaymentProductFiltersHostedFields < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :exclude

        attr_accessor :restrict_to

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(exclude: nil, restrict_to: nil)
          super()
          @exclude = exclude
          @restrict_to = restrict_to
        end

        # Sets the property and returns this same instance.
        def with_exclude(value)
          @exclude = value
          self
        end

        # Sets the property and returns this same instance.
        def with_restrict_to(value)
          @restrict_to = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['exclude'] = @exclude unless @exclude.nil?
          hash['restrictTo'] = @restrict_to unless @restrict_to.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'exclude'
            raise TypeError, "value '#{hash['exclude']}' is not an Array" unless hash['exclude'].is_a? Array
            @exclude = []
            hash['exclude'].each do |e|
              @exclude << e
            end
          end
          if hash.key? 'restrictTo'
            raise TypeError, "value '#{hash['restrictTo']}' is not an Array" unless hash['restrictTo'].is_a? Array
            @restrict_to = []
            hash['restrictTo'].each do |e|
              @restrict_to << e
            end
          end
        end
      end
    end
  end
end
