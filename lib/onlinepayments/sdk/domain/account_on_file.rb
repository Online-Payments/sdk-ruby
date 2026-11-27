# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/account_on_file_attribute'
require 'onlinepayments/sdk/domain/account_on_file_display_hints'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::AccountOnFileAttribute>, nil] attributes
      # @attr [OnlinePayments::SDK::Domain::AccountOnFileDisplayHints, nil] display_hints
      # @attr [String, nil] id
      # @attr [Integer, nil] payment_product_id
      class AccountOnFile < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :attributes

        attr_accessor :display_hints

        attr_accessor :id

        attr_accessor :payment_product_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(attributes: nil, display_hints: nil, id: nil, payment_product_id: nil)
          super()
          @attributes = attributes
          @display_hints = display_hints
          @id = id
          @payment_product_id = payment_product_id
        end

        # Sets the property and returns this same instance.
        def with_attributes(value)
          @attributes = value
          self
        end

        # Sets the property and returns this same instance.
        def with_display_hints(value)
          @display_hints = value
          self
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_id(value)
          @payment_product_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['attributes'] = @attributes.collect{|val| val.to_h} unless @attributes.nil?
          hash['displayHints'] = @display_hints.to_h unless @display_hints.nil?
          hash['id'] = @id unless @id.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'attributes'
            raise TypeError, "value '#{hash['attributes']}' is not an Array" unless hash['attributes'].is_a? Array
            @attributes = []
            hash['attributes'].each do |e|
              @attributes << OnlinePayments::SDK::Domain::AccountOnFileAttribute.new_from_hash(e)
            end
          end
          if hash.key? 'displayHints'
            raise TypeError, "value '#{hash['displayHints']}' is not a Hash" unless hash['displayHints'].is_a? Hash
            @display_hints = OnlinePayments::SDK::Domain::AccountOnFileDisplayHints.new_from_hash(hash['displayHints'])
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
        end
      end
    end
  end
end
