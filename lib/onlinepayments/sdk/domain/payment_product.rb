#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/account_on_file'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product302_specific_data'
require 'onlinepayments/sdk/domain/payment_product320_specific_data'
require 'onlinepayments/sdk/domain/payment_product_display_hints'
require 'onlinepayments/sdk/domain/payment_product_field'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::AccountOnFile>] accounts_on_file
      # @attr [true/false] allows_authentication
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
      class PaymentProduct < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :accounts_on_file

        attr_accessor :allows_authentication

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
          hash['accountsOnFile'] = @accounts_on_file.collect{|val| val.to_h} unless @accounts_on_file.nil?
          hash['allowsAuthentication'] = @allows_authentication unless @allows_authentication.nil?
          hash['allowsRecurring'] = @allows_recurring unless @allows_recurring.nil?
          hash['allowsTokenization'] = @allows_tokenization unless @allows_tokenization.nil?
          hash['displayHints'] = @display_hints.to_h unless @display_hints.nil?
          hash['displayHintsList'] = @display_hints_list.collect{|val| val.to_h} unless @display_hints_list.nil?
          hash['fields'] = @fields.collect{|val| val.to_h} unless @fields.nil?
          hash['id'] = @id unless @id.nil?
          hash['paymentMethod'] = @payment_method unless @payment_method.nil?
          hash['paymentProduct302SpecificData'] = @payment_product302_specific_data.to_h unless @payment_product302_specific_data.nil?
          hash['paymentProduct320SpecificData'] = @payment_product320_specific_data.to_h unless @payment_product320_specific_data.nil?
          hash['paymentProductGroup'] = @payment_product_group unless @payment_product_group.nil?
          hash['usesRedirectionTo3rdParty'] = @uses_redirection_to3rd_party unless @uses_redirection_to3rd_party.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'accountsOnFile'
            raise TypeError, "value '%s' is not an Array" % [hash['accountsOnFile']] unless hash['accountsOnFile'].is_a? Array
            @accounts_on_file = []
            hash['accountsOnFile'].each do |e|
              @accounts_on_file << OnlinePayments::SDK::Domain::AccountOnFile.new_from_hash(e)
            end
          end
          if hash.has_key? 'allowsAuthentication'
            @allows_authentication = hash['allowsAuthentication']
          end
          if hash.has_key? 'allowsRecurring'
            @allows_recurring = hash['allowsRecurring']
          end
          if hash.has_key? 'allowsTokenization'
            @allows_tokenization = hash['allowsTokenization']
          end
          if hash.has_key? 'displayHints'
            raise TypeError, "value '%s' is not a Hash" % [hash['displayHints']] unless hash['displayHints'].is_a? Hash
            @display_hints = OnlinePayments::SDK::Domain::PaymentProductDisplayHints.new_from_hash(hash['displayHints'])
          end
          if hash.has_key? 'displayHintsList'
            raise TypeError, "value '%s' is not an Array" % [hash['displayHintsList']] unless hash['displayHintsList'].is_a? Array
            @display_hints_list = []
            hash['displayHintsList'].each do |e|
              @display_hints_list << OnlinePayments::SDK::Domain::PaymentProductDisplayHints.new_from_hash(e)
            end
          end
          if hash.has_key? 'fields'
            raise TypeError, "value '%s' is not an Array" % [hash['fields']] unless hash['fields'].is_a? Array
            @fields = []
            hash['fields'].each do |e|
              @fields << OnlinePayments::SDK::Domain::PaymentProductField.new_from_hash(e)
            end
          end
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'paymentMethod'
            @payment_method = hash['paymentMethod']
          end
          if hash.has_key? 'paymentProduct302SpecificData'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct302SpecificData']] unless hash['paymentProduct302SpecificData'].is_a? Hash
            @payment_product302_specific_data = OnlinePayments::SDK::Domain::PaymentProduct302SpecificData.new_from_hash(hash['paymentProduct302SpecificData'])
          end
          if hash.has_key? 'paymentProduct320SpecificData'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct320SpecificData']] unless hash['paymentProduct320SpecificData'].is_a? Hash
            @payment_product320_specific_data = OnlinePayments::SDK::Domain::PaymentProduct320SpecificData.new_from_hash(hash['paymentProduct320SpecificData'])
          end
          if hash.has_key? 'paymentProductGroup'
            @payment_product_group = hash['paymentProductGroup']
          end
          if hash.has_key? 'usesRedirectionTo3rdParty'
            @uses_redirection_to3rd_party = hash['usesRedirectionTo3rdParty']
          end
        end
      end
    end
  end
end
