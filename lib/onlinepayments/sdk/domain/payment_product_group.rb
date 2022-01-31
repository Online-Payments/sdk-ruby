#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/account_on_file'
require 'onlinepayments/sdk/domain/payment_product_display_hints'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AccountOnFile] account_on_file
    # @attr [OnlinePayments::SDK::Domain::PaymentProductDisplayHints] display_hints
    # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductDisplayHints>] display_hints_list
    # @attr [String] id
    class PaymentProductGroup < OnlinePayments::SDK::DataObject
      attr_accessor :account_on_file
      attr_accessor :display_hints
      attr_accessor :display_hints_list
      attr_accessor :id

      # @return (Hash)
      def to_h
        hash = super
        hash['accountOnFile'] = @account_on_file.to_h if @account_on_file
        hash['displayHints'] = @display_hints.to_h if @display_hints
        hash['displayHintsList'] = @display_hints_list.collect(&:to_h) if @display_hints_list
        hash['id'] = @id unless @id.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'accountOnFile'
          raise TypeError, "value '%s' is not a Hash" % [hash['accountOnFile']] unless hash['accountOnFile'].is_a? Hash
          @account_on_file = OnlinePayments::SDK::Domain::AccountOnFile.new_from_hash(hash['accountOnFile'])
        end
        if hash.key? 'displayHints'
          raise TypeError, "value '%s' is not a Hash" % [hash['displayHints']] unless hash['displayHints'].is_a? Hash
          @display_hints = OnlinePayments::SDK::Domain::PaymentProductDisplayHints.new_from_hash(hash['displayHints'])
        end
        if hash.key? 'displayHintsList'
          raise TypeError, "value '%s' is not an Array" % [hash['displayHintsList']] unless hash['displayHintsList'].is_a? Array
          @display_hints_list = []
          hash['displayHintsList'].each do |e|
            @display_hints_list << OnlinePayments::SDK::Domain::PaymentProductDisplayHints.new_from_hash(e)
          end
        end
        @id = hash['id'] if hash.key? 'id'
      end
    end
  end
end
