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
          if hash.has_key? 'exclude'
            raise TypeError, "value '%s' is not an Array" % [hash['exclude']] unless hash['exclude'].is_a? Array
            @exclude = []
            hash['exclude'].each do |e|
              @exclude << e
            end
          end
          if hash.has_key? 'restrictTo'
            raise TypeError, "value '%s' is not an Array" % [hash['restrictTo']] unless hash['restrictTo'].is_a? Array
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
