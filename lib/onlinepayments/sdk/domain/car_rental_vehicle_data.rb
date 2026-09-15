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

        # @return (Hash)
        def to_h
          hash = super
          hash['classId'] = @class_id unless @class_id.nil?
          hash['identificationNumber'] = @identification_number unless @identification_number.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'classId'
            @class_id = hash['classId']
          end
          if hash.has_key? 'identificationNumber'
            @identification_number = hash['identificationNumber']
          end
        end
      end
    end
  end
end
