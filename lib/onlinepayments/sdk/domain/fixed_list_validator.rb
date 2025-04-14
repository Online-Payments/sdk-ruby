#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>] allowed_values
      class FixedListValidator < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :allowed_values

        # @return (Hash)
        def to_h
          hash = super
          hash['allowedValues'] = @allowed_values unless @allowed_values.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'allowedValues'
            raise TypeError, "value '%s' is not an Array" % [hash['allowedValues']] unless hash['allowedValues'].is_a? Array
            @allowed_values = []
            hash['allowedValues'].each do |e|
              @allowed_values << e
            end
          end
        end
      end
    end
  end
end
