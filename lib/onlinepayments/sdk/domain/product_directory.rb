#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/directory_entry'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::DirectoryEntry>] entries
    class ProductDirectory < OnlinePayments::SDK::DataObject
      attr_accessor :entries

      # @return (Hash)
      def to_h
        hash = super
        hash['entries'] = @entries.collect(&:to_h) if @entries
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'entries'
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
