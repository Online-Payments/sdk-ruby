#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/acquirer_selection_information'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AcquirerSelectionInformation] acquirer_selection_information
      # @attr [String] name
      class AcquirerInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_selection_information

        attr_accessor :name

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerSelectionInformation'] = @acquirer_selection_information.to_h unless @acquirer_selection_information.nil?
          hash['name'] = @name unless @name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acquirerSelectionInformation'
            raise TypeError, "value '%s' is not a Hash" % [hash['acquirerSelectionInformation']] unless hash['acquirerSelectionInformation'].is_a? Hash
            @acquirer_selection_information = OnlinePayments::SDK::Domain::AcquirerSelectionInformation.new_from_hash(hash['acquirerSelectionInformation'])
          end
          if hash.has_key? 'name'
            @name = hash['name']
          end
        end
      end
    end
  end
end
