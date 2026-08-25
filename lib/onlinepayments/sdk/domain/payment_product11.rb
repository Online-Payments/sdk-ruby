#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] payment_bic
      # @attr [String] payment_beneficiary
      # @attr [String] payment_iban
      # @attr [String] payment_reference
      # @attr [String] qr_code
      class PaymentProduct11 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_bic

        attr_accessor :payment_beneficiary

        attr_accessor :payment_iban

        attr_accessor :payment_reference

        attr_accessor :qr_code

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentBIC'] = @payment_bic unless @payment_bic.nil?
          hash['paymentBeneficiary'] = @payment_beneficiary unless @payment_beneficiary.nil?
          hash['paymentIBAN'] = @payment_iban unless @payment_iban.nil?
          hash['paymentReference'] = @payment_reference unless @payment_reference.nil?
          hash['qrCode'] = @qr_code unless @qr_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentBIC'
            @payment_bic = hash['paymentBIC']
          end
          if hash.has_key? 'paymentBeneficiary'
            @payment_beneficiary = hash['paymentBeneficiary']
          end
          if hash.has_key? 'paymentIBAN'
            @payment_iban = hash['paymentIBAN']
          end
          if hash.has_key? 'paymentReference'
            @payment_reference = hash['paymentReference']
          end
          if hash.has_key? 'qrCode'
            @qr_code = hash['qrCode']
          end
        end
      end
    end
  end
end
