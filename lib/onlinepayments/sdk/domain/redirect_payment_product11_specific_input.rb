#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Date] first_installment_payment_date
      class RedirectPaymentProduct11SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :first_installment_payment_date

        # @return (Hash)
        def to_h
          hash = super
          hash['firstInstallmentPaymentDate'] = @first_installment_payment_date.iso8601 unless @first_installment_payment_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'firstInstallmentPaymentDate'
            @first_installment_payment_date = Date.parse(hash['firstInstallmentPaymentDate'])
          end
        end
      end
    end
  end
end
