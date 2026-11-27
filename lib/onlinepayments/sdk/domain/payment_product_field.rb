# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_data_restrictions'
require 'onlinepayments/sdk/domain/payment_product_field_display_hints'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldDataRestrictions, nil] data_restrictions
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldDisplayHints, nil] display_hints
      # @attr [String, nil] id
      # @attr [String, nil] type
      class PaymentProductField < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :data_restrictions

        attr_accessor :display_hints

        attr_accessor :id

        attr_accessor :type

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(data_restrictions: nil, display_hints: nil, id: nil, type: nil)
          super()
          @data_restrictions = data_restrictions
          @display_hints = display_hints
          @id = id
          @type = type
        end

        # Sets the property and returns this same instance.
        def with_data_restrictions(value)
          @data_restrictions = value
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
        def with_type(value)
          @type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['dataRestrictions'] = @data_restrictions.to_h unless @data_restrictions.nil?
          hash['displayHints'] = @display_hints.to_h unless @display_hints.nil?
          hash['id'] = @id unless @id.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'dataRestrictions'
            raise TypeError, "value '#{hash['dataRestrictions']}' is not a Hash" unless hash['dataRestrictions'].is_a? Hash
            @data_restrictions = OnlinePayments::SDK::Domain::PaymentProductFieldDataRestrictions.new_from_hash(hash['dataRestrictions'])
          end
          if hash.key? 'displayHints'
            raise TypeError, "value '#{hash['displayHints']}' is not a Hash" unless hash['displayHints'].is_a? Hash
            @display_hints = OnlinePayments::SDK::Domain::PaymentProductFieldDisplayHints.new_from_hash(hash['displayHints'])
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
