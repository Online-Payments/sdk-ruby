# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::MandateResponse, nil] mandate
      class GetMandateResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mandate

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(mandate: nil)
          super()
          @mandate = mandate
        end

        # Sets the property and returns this same instance.
        def with_mandate(value)
          @mandate = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['mandate'] = @mandate.to_h unless @mandate.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'mandate'
            raise TypeError, "value '#{hash['mandate']}' is not a Hash" unless hash['mandate'].is_a? Hash
            @mandate = OnlinePayments::SDK::Domain::MandateResponse.new_from_hash(hash['mandate'])
          end
        end
      end
    end
  end
end
