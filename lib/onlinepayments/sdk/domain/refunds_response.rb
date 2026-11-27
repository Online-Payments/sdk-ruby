# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/refund_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::RefundResponse>, nil] refunds
      class RefundsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :refunds

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(refunds: nil)
          super()
          @refunds = refunds
        end

        # Sets the property and returns this same instance.
        def with_refunds(value)
          @refunds = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['refunds'] = @refunds.collect{|val| val.to_h} unless @refunds.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'refunds'
            raise TypeError, "value '#{hash['refunds']}' is not an Array" unless hash['refunds'].is_a? Array
            @refunds = []
            hash['refunds'].each do |e|
              @refunds << OnlinePayments::SDK::Domain::RefundResponse.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
