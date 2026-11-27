# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/directory_entry'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::DirectoryEntry>, nil] entries
      class ProductDirectory < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :entries

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(entries: nil)
          super()
          @entries = entries
        end

        # Sets the property and returns this same instance.
        def with_entries(value)
          @entries = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['entries'] = @entries.collect{|val| val.to_h} unless @entries.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'entries'
            raise TypeError, "value '#{hash['entries']}' is not an Array" unless hash['entries'].is_a? Array
            @entries = []
            hash['entries'].each do |e|
              @entries << OnlinePayments::SDK::Domain::DirectoryEntry.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
