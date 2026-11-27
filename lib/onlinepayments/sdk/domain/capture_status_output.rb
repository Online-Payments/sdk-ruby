# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer, nil] status_code
      class CaptureStatusOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :status_code

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(status_code: nil)
          super()
          @status_code = status_code
        end

        # Sets the property and returns this same instance.
        def with_status_code(value)
          @status_code = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['statusCode'] = @status_code unless @status_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'statusCode'
            @status_code = hash['statusCode']
          end
        end
      end
    end
  end
end
