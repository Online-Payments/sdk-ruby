#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/account_on_file'
require 'onlinepayments/sdk/domain/payment_product302_specific_data'
require 'onlinepayments/sdk/domain/payment_product320_specific_data'
require 'onlinepayments/sdk/domain/payment_product_display_hints'
require 'onlinepayments/sdk/domain/payment_product_field'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::AccountOnFile>] accounts_on_file
    # @attr [true/false] allows_recurring
    # @attr [true/false] allows_tokenization
    # @attr [OnlinePayments::SDK::Domain::PaymentProductDisplayHints] display_hints
    # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductDisplayHints>] display_hints_list
    # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductField>] fields
    # @attr [Integer] id
    # @attr [String] payment_method
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct302SpecificData] payment_product302_specific_data
    # @attr [OnlinePayments::SDK::Domain::PaymentProduct320SpecificData] payment_product320_specific_data
    # @attr [String] payment_product_group
    # @attr [true/false] uses_redirection_to3rd_party
    class PaymentProduct < OnlinePayments::SDK::DataObject
      attr_accessor :accounts_on_file
      attr_accessor :allows_recurring
      attr_accessor :allows_tokenization
      attr_accessor :display_hints
      attr_accessor :display_hints_list
      attr_accessor :fields
      attr_accessor :id
      attr_accessor :payment_method
      attr_accessor :payment_product302_specific_data
      attr_accessor :payment_product320_specific_data
      attr_accessor :payment_product_group
      attr_accessor :uses_redirection_to3rd_party

      # @return (Hash)
      def to_h
        hash = super
        hash['accountsOnFile'] = @accounts_on_file.collect(&:to_h) if @accounts_on_file
        hash['allowsRecurring'] = @allows_recurring unless @allows_recurring.nil?
        hash['allowsTokenization'] = @allows_tokenization unless @allows_tokenization.nil?
        hash['displayHints'] = @display_hints.to_h if @display_hints
        hash['displayHintsList'] = @display_hints_list.collect(&:to_h) if @display_hints_list
        hash['fields'] = @fields.collect(&:to_h) if @fields
        hash['id'] = @id unless @id.nil?
        hash['paymentMethod'] = @payment_method unless @payment_method.nil?
        hash['paymentProduct302SpecificData'] = @payment_product302_specific_data.to_h if @payment_product302_specific_data
        hash['paymentProduct320SpecificData'] = @payment_product320_specific_data.to_h if @payment_product320_specific_data
        hash['paymentProductGroup'] = @payment_product_group unless @payment_product_group.nil?
        hash['usesRedirectionTo3rdParty'] = @uses_redirection_to3rd_party unless @uses_redirection_to3rd_party.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'accountsOnFile'
          raise TypeError, "value '%s' is not an Array" % [hash['accountsOnFile']] unless hash['accountsOnFile'].is_a? Array
          @accounts_on_file = []
          hash['accountsOnFile'].each do |e|
            @accounts_on_file << OnlinePayments::SDK::Domain::AccountOnFile.new_from_hash(e)
          end
        end
        @allows_recurring = hash['allowsRecurring'] if hash.key? 'allowsRecurring'
        @allows_tokenization = hash['allowsTokenization'] if hash.key? 'allowsTokenization'
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
        if hash.key? 'fields'
          raise TypeError, "value '%s' is not an Array" % [hash['fields']] unless hash['fields'].is_a? Array
          @fields = []
          hash['fields'].each do |e|
            @fields << OnlinePayments::SDK::Domain::PaymentProductField.new_from_hash(e)
          end
        end
        @id = hash['id'] if hash.key? 'id'
        @payment_method = hash['paymentMethod'] if hash.key? 'paymentMethod'
        if hash.key? 'paymentProduct302SpecificData'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct302SpecificData']] unless hash['paymentProduct302SpecificData'].is_a? Hash
          @payment_product302_specific_data = OnlinePayments::SDK::Domain::PaymentProduct302SpecificData.new_from_hash(hash['paymentProduct302SpecificData'])
        end
        if hash.key? 'paymentProduct320SpecificData'
          raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct320SpecificData']] unless hash['paymentProduct320SpecificData'].is_a? Hash
          @payment_product320_specific_data = OnlinePayments::SDK::Domain::PaymentProduct320SpecificData.new_from_hash(hash['paymentProduct320SpecificData'])
        end
        @payment_product_group = hash['paymentProductGroup'] if hash.key? 'paymentProductGroup'
        @uses_redirection_to3rd_party = hash['usesRedirectionTo3rdParty'] if hash.key? 'usesRedirectionTo3rdParty'
      end
    end
  end
end
