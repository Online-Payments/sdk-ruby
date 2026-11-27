# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] url
      class SendTestRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :url

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(url: nil)
          super()
          @url = url
        end

        # Sets the property and returns this same instance.
        def with_url(value)
          @url = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['url'] = @url unless @url.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'url'
            @url = hash['url']
          end
        end
      end
    end
  end
end
