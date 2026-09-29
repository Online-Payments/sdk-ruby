#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>, nil] tokens
      class SessionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :tokens

        # Sets the property and returns this same instance.
        def with_tokens(value)
          @tokens = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['tokens'] = @tokens unless @tokens.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'tokens'
            raise TypeError, "value '%s' is not an Array" % [hash['tokens']] unless hash['tokens'].is_a? Array
            @tokens = []
            hash['tokens'].each do |e|
              @tokens << e
            end
          end
        end
      end
    end
  end
end
