# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_merchant_action'
require 'onlinepayments/sdk/domain/mandate_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::MandateResponse, nil] mandate
      # @attr [OnlinePayments::SDK::Domain::MandateMerchantAction, nil] merchant_action
      class CreateMandateResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :mandate

        attr_accessor :merchant_action

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(mandate: nil, merchant_action: nil)
          super()
          @mandate = mandate
          @merchant_action = merchant_action
        end

        # Sets the property and returns this same instance.
        def with_mandate(value)
          @mandate = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_action(value)
          @merchant_action = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['mandate'] = @mandate.to_h unless @mandate.nil?
          hash['merchantAction'] = @merchant_action.to_h unless @merchant_action.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'mandate'
            raise TypeError, "value '#{hash['mandate']}' is not a Hash" unless hash['mandate'].is_a? Hash
            @mandate = OnlinePayments::SDK::Domain::MandateResponse.new_from_hash(hash['mandate'])
          end
          if hash.key? 'merchantAction'
            raise TypeError, "value '#{hash['merchantAction']}' is not a Hash" unless hash['merchantAction'].is_a? Hash
            @merchant_action = OnlinePayments::SDK::Domain::MandateMerchantAction.new_from_hash(hash['merchantAction'])
          end
        end
      end
    end
  end
end
