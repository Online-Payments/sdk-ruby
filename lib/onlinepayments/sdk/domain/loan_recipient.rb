#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] account_number
    # @attr [String] date_of_birth
    # @attr [String] partial_pan
    # @attr [String] surname
    # @attr [String] zip
    class LoanRecipient < OnlinePayments::SDK::DataObject
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
        @account_number = hash['accountNumber'] if hash.key? 'accountNumber'
        @date_of_birth = hash['dateOfBirth'] if hash.key? 'dateOfBirth'
        @partial_pan = hash['partialPan'] if hash.key? 'partialPan'
        @surname = hash['surname'] if hash.key? 'surname'
        @zip = hash['zip'] if hash.key? 'zip'
      end
    end
  end
end
