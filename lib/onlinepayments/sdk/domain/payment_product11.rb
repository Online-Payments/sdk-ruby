# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] payment_bic
      # @attr [String, nil] payment_beneficiary
      # @attr [String, nil] payment_iban
      # @attr [String, nil] payment_reference
      # @attr [String, nil] qr_code
      class PaymentProduct11 < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_bic

        attr_accessor :payment_beneficiary

        attr_accessor :payment_iban

        attr_accessor :payment_reference

        attr_accessor :qr_code

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(payment_bic: nil, payment_beneficiary: nil, payment_iban: nil, payment_reference: nil, qr_code: nil)
          super()
          @payment_bic = payment_bic
          @payment_beneficiary = payment_beneficiary
          @payment_iban = payment_iban
          @payment_reference = payment_reference
          @qr_code = qr_code
        end

        # Sets the property and returns this same instance.
        def with_payment_bic(value)
          @payment_bic = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_beneficiary(value)
          @payment_beneficiary = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_iban(value)
          @payment_iban = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_reference(value)
          @payment_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_qr_code(value)
          @qr_code = value
          self
        end

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
          if hash.key? 'paymentBIC'
            @payment_bic = hash['paymentBIC']
          end
          if hash.key? 'paymentBeneficiary'
            @payment_beneficiary = hash['paymentBeneficiary']
          end
          if hash.key? 'paymentIBAN'
            @payment_iban = hash['paymentIBAN']
          end
          if hash.key? 'paymentReference'
            @payment_reference = hash['paymentReference']
          end
          if hash.key? 'qrCode'
            @qr_code = hash['qrCode']
          end
        end
      end
    end
  end
end
