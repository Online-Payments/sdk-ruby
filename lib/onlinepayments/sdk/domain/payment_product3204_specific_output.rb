# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] banking_app_label
      class PaymentProduct3204SpecificOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :banking_app_label

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(banking_app_label: nil)
          super()
          @banking_app_label = banking_app_label
        end

        # Sets the property and returns this same instance.
        def with_banking_app_label(value)
          @banking_app_label = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['bankingAppLabel'] = @banking_app_label unless @banking_app_label.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'bankingAppLabel'
            @banking_app_label = hash['bankingAppLabel']
          end
        end
      end
    end
  end
end
