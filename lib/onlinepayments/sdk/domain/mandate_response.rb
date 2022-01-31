#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/mandate_customer'

module OnlinePayments::SDK
  module Domain

    # @attr [String] alias
    # @attr [OnlinePayments::SDK::Domain::MandateCustomer] customer
    # @attr [String] customer_reference
    # @attr [String] recurrence_type
    # @attr [String] status
    # @attr [String] unique_mandate_reference
    class MandateResponse < OnlinePayments::SDK::DataObject
      attr_accessor :alias
      attr_accessor :customer
      attr_accessor :customer_reference
      attr_accessor :recurrence_type
      attr_accessor :status
      attr_accessor :unique_mandate_reference

      # @return (Hash)
      def to_h
        hash = super
        hash['alias'] = @alias unless @alias.nil?
        hash['customer'] = @customer.to_h if @customer
        hash['customerReference'] = @customer_reference unless @customer_reference.nil?
        hash['recurrenceType'] = @recurrence_type unless @recurrence_type.nil?
        hash['status'] = @status unless @status.nil?
        hash['uniqueMandateReference'] = @unique_mandate_reference unless @unique_mandate_reference.nil?
        hash
      end

      def from_hash(hash)
        super
        @alias = hash['alias'] if hash.key? 'alias'
        if hash.key? 'customer'
          raise TypeError, "value '%s' is not a Hash" % [hash['customer']] unless hash['customer'].is_a? Hash
          @customer = OnlinePayments::SDK::Domain::MandateCustomer.new_from_hash(hash['customer'])
        end
        @customer_reference = hash['customerReference'] if hash.key? 'customerReference'
        @recurrence_type = hash['recurrenceType'] if hash.key? 'recurrenceType'
        @status = hash['status'] if hash.key? 'status'
        @unique_mandate_reference = hash['uniqueMandateReference'] if hash.key? 'uniqueMandateReference'
      end
    end
  end
end
