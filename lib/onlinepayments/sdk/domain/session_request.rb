# frozen_string_literal: true

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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(tokens: nil)
          super()
          @tokens = tokens
        end

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
          if hash.key? 'tokens'
            raise TypeError, "value '#{hash['tokens']}' is not an Array" unless hash['tokens'].is_a? Array
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
