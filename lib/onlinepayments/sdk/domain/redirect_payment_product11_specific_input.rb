#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] skip_email_validation
      class RedirectPaymentProduct11SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :skip_email_validation

        # @return (Hash)
        def to_h
          hash = super
          hash['skipEmailValidation'] = @skip_email_validation unless @skip_email_validation.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'skipEmailValidation'
            @skip_email_validation = hash['skipEmailValidation']
          end
        end
      end
    end
  end
end
