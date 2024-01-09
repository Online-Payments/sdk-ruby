#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/acquirer_selection_information'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AcquirerSelectionInformation] acquirer_selection_information
    # @attr [String] name
    class AcquirerInformation < OnlinePayments::SDK::DataObject
      attr_accessor :acquirer_selection_information
      attr_accessor :name

      # @return (Hash)
      def to_h
        hash = super
        hash['acquirerSelectionInformation'] = @acquirer_selection_information.to_h if @acquirer_selection_information
        hash['name'] = @name unless @name.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'acquirerSelectionInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['acquirerSelectionInformation']] unless hash['acquirerSelectionInformation'].is_a? Hash
          @acquirer_selection_information = OnlinePayments::SDK::Domain::AcquirerSelectionInformation.new_from_hash(hash['acquirerSelectionInformation'])
        end
        @name = hash['name'] if hash.key? 'name'
      end
    end
  end
end
