#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/directory_entry'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::DirectoryEntry>] entries
      class ProductDirectory < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :entries

        # @return (Hash)
        def to_h
          hash = super
          hash['entries'] = @entries.collect{|val| val.to_h} unless @entries.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'entries'
            raise TypeError, "value '%s' is not an Array" % [hash['entries']] unless hash['entries'].is_a? Array
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
