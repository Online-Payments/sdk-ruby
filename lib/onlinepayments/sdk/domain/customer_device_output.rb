#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] ip_address_country_code
      class CustomerDeviceOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :ip_address_country_code

        # Sets the property and returns this same instance.
        def with_ip_address_country_code(value)
          @ip_address_country_code = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['ipAddressCountryCode'] = @ip_address_country_code unless @ip_address_country_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'ipAddressCountryCode'
            @ip_address_country_code = hash['ipAddressCountryCode']
          end
        end
      end
    end
  end
end
