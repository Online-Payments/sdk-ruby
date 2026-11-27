# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/account_on_file'
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_display_hints'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AccountOnFile, nil] account_on_file
      # @attr [OnlinePayments::SDK::Domain::PaymentProductDisplayHints, nil] display_hints
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentProductDisplayHints>, nil] display_hints_list
      # @attr [String, nil] id
      class PaymentProductGroup < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :account_on_file

        attr_accessor :display_hints

        attr_accessor :display_hints_list

        attr_accessor :id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(account_on_file: nil, display_hints: nil, display_hints_list: nil, id: nil)
          super()
          @account_on_file = account_on_file
          @display_hints = display_hints
          @display_hints_list = display_hints_list
          @id = id
        end

        # Sets the property and returns this same instance.
        def with_account_on_file(value)
          @account_on_file = value
          self
        end

        # Sets the property and returns this same instance.
        def with_display_hints(value)
          @display_hints = value
          self
        end

        # Sets the property and returns this same instance.
        def with_display_hints_list(value)
          @display_hints_list = value
          self
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['accountOnFile'] = @account_on_file.to_h unless @account_on_file.nil?
          hash['displayHints'] = @display_hints.to_h unless @display_hints.nil?
          hash['displayHintsList'] = @display_hints_list.collect{|val| val.to_h} unless @display_hints_list.nil?
          hash['id'] = @id unless @id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'accountOnFile'
            raise TypeError, "value '#{hash['accountOnFile']}' is not a Hash" unless hash['accountOnFile'].is_a? Hash
            @account_on_file = OnlinePayments::SDK::Domain::AccountOnFile.new_from_hash(hash['accountOnFile'])
          end
          if hash.key? 'displayHints'
            raise TypeError, "value '#{hash['displayHints']}' is not a Hash" unless hash['displayHints'].is_a? Hash
            @display_hints = OnlinePayments::SDK::Domain::PaymentProductDisplayHints.new_from_hash(hash['displayHints'])
          end
          if hash.key? 'displayHintsList'
            raise TypeError, "value '#{hash['displayHintsList']}' is not an Array" unless hash['displayHintsList'].is_a? Array
            @display_hints_list = []
            hash['displayHintsList'].each do |e|
              @display_hints_list << OnlinePayments::SDK::Domain::PaymentProductDisplayHints.new_from_hash(e)
            end
          end
          if hash.key? 'id'
            @id = hash['id']
          end
        end
      end
    end
  end
end
