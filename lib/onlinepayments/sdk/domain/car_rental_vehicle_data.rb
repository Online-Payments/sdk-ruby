# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] class_id
      # @attr [String, nil] identification_number
      class CarRentalVehicleData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :class_id

        attr_accessor :identification_number

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(class_id: nil, identification_number: nil)
          super()
          @class_id = class_id
          @identification_number = identification_number
        end

        # Sets the property and returns this same instance.
        def with_class_id(value)
          @class_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_identification_number(value)
          @identification_number = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['classId'] = @class_id unless @class_id.nil?
          hash['identificationNumber'] = @identification_number unless @identification_number.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'classId'
            @class_id = hash['classId']
          end
          if hash.key? 'identificationNumber'
            @identification_number = hash['identificationNumber']
          end
        end
      end
    end
  end
end
