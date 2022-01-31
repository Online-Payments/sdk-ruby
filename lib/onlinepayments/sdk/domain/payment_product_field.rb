#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/payment_product_field_data_restrictions'
require 'onlinepayments/sdk/domain/payment_product_field_display_hints'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldDataRestrictions] data_restrictions
    # @attr [OnlinePayments::SDK::Domain::PaymentProductFieldDisplayHints] display_hints
    # @attr [String] id
    # @attr [String] type
    class PaymentProductField < OnlinePayments::SDK::DataObject
      attr_accessor :data_restrictions
      attr_accessor :display_hints
      attr_accessor :id
      attr_accessor :type

      # @return (Hash)
      def to_h
        hash = super
        hash['dataRestrictions'] = @data_restrictions.to_h if @data_restrictions
        hash['displayHints'] = @display_hints.to_h if @display_hints
        hash['id'] = @id unless @id.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'dataRestrictions'
          raise TypeError, "value '%s' is not a Hash" % [hash['dataRestrictions']] unless hash['dataRestrictions'].is_a? Hash
          @data_restrictions = OnlinePayments::SDK::Domain::PaymentProductFieldDataRestrictions.new_from_hash(hash['dataRestrictions'])
        end
        if hash.key? 'displayHints'
          raise TypeError, "value '%s' is not a Hash" % [hash['displayHints']] unless hash['displayHints'].is_a? Hash
          @display_hints = OnlinePayments::SDK::Domain::PaymentProductFieldDisplayHints.new_from_hash(hash['displayHints'])
        end
        @id = hash['id'] if hash.key? 'id'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
