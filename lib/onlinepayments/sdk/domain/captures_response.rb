# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/capture'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::Capture>, nil] captures
      class CapturesResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :captures

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(captures: nil)
          super()
          @captures = captures
        end

        # Sets the property and returns this same instance.
        def with_captures(value)
          @captures = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['captures'] = @captures.collect{|val| val.to_h} unless @captures.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'captures'
            raise TypeError, "value '#{hash['captures']}' is not an Array" unless hash['captures'].is_a? Array
            @captures = []
            hash['captures'].each do |e|
              @captures << OnlinePayments::SDK::Domain::Capture.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
