#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Date] second_installment_payment_date
      class RedirectPaymentProduct5410SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :second_installment_payment_date

        # @return (Hash)
        def to_h
          hash = super
          hash['secondInstallmentPaymentDate'] = @second_installment_payment_date.iso8601 unless @second_installment_payment_date.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'secondInstallmentPaymentDate'
            @second_installment_payment_date = Date.parse(hash['secondInstallmentPaymentDate'])
          end
        end
      end
    end
  end
end
