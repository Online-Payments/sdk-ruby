# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] result
      class ValidateCredentialsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :result

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(result: nil)
          super()
          @result = result
        end

        # Sets the property and returns this same instance.
        def with_result(value)
          @result = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['result'] = @result unless @result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'result'
            @result = hash['result']
          end
        end
      end
    end
  end
end
