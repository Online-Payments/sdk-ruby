#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] account_number
      # @attr [String] date_of_birth
      # @attr [String] partial_pan
      # @attr [String] surname
      # @attr [String] zip
      class LoanRecipient < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :account_number

        attr_accessor :date_of_birth

        attr_accessor :partial_pan

        attr_accessor :surname

        attr_accessor :zip

        # @return (Hash)
        def to_h
          hash = super
          hash['accountNumber'] = @account_number unless @account_number.nil?
          hash['dateOfBirth'] = @date_of_birth unless @date_of_birth.nil?
          hash['partialPan'] = @partial_pan unless @partial_pan.nil?
          hash['surname'] = @surname unless @surname.nil?
          hash['zip'] = @zip unless @zip.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'accountNumber'
            @account_number = hash['accountNumber']
          end
          if hash.has_key? 'dateOfBirth'
            @date_of_birth = hash['dateOfBirth']
          end
          if hash.has_key? 'partialPan'
            @partial_pan = hash['partialPan']
          end
          if hash.has_key? 'surname'
            @surname = hash['surname']
          end
          if hash.has_key? 'zip'
            @zip = hash['zip']
          end
        end
      end
    end
  end
end
