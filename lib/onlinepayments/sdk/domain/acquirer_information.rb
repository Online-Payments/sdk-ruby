# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/acquirer_selection_information'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AcquirerSelectionInformation, nil] acquirer_selection_information
      # @attr [String, nil] name
      class AcquirerInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_selection_information

        attr_accessor :name

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(acquirer_selection_information: nil, name: nil)
          super()
          @acquirer_selection_information = acquirer_selection_information
          @name = name
        end

        # Sets the property and returns this same instance.
        def with_acquirer_selection_information(value)
          @acquirer_selection_information = value
          self
        end

        # Sets the property and returns this same instance.
        def with_name(value)
          @name = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerSelectionInformation'] = @acquirer_selection_information.to_h unless @acquirer_selection_information.nil?
          hash['name'] = @name unless @name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'acquirerSelectionInformation'
            raise TypeError, "value '#{hash['acquirerSelectionInformation']}' is not a Hash" unless hash['acquirerSelectionInformation'].is_a? Hash
            @acquirer_selection_information = OnlinePayments::SDK::Domain::AcquirerSelectionInformation.new_from_hash(hash['acquirerSelectionInformation'])
          end
          if hash.key? 'name'
            @name = hash['name']
          end
        end
      end
    end
  end
end
