#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] email_address
      class MandateContactDetails < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :email_address

        # @return (Hash)
        def to_h
          hash = super
          hash['emailAddress'] = @email_address unless @email_address.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'emailAddress'
            @email_address = hash['emailAddress']
          end
        end
      end
    end
  end
end
