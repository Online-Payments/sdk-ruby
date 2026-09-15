#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_parameters'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::ApiParameters, nil] api_parameters
      class PaymentProduct5002SpecificData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :api_parameters

        # @return (Hash)
        def to_h
          hash = super
          hash['apiParameters'] = @api_parameters.to_h unless @api_parameters.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'apiParameters'
            raise TypeError, "value '%s' is not a Hash" % [hash['apiParameters']] unless hash['apiParameters'].is_a? Hash
            @api_parameters = OnlinePayments::SDK::Domain::ApiParameters.new_from_hash(hash['apiParameters'])
          end
        end
      end
    end
  end
end
