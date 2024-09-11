#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] first_name
    # @attr [String] surname
    class MandatePersonalNameResponse < OnlinePayments::SDK::DataObject
      attr_accessor :first_name
      attr_accessor :surname

      # @return (Hash)
      def to_h
        hash = super
        hash['firstName'] = @first_name unless @first_name.nil?
        hash['surname'] = @surname unless @surname.nil?
        hash
      end

      def from_hash(hash)
        super
        @first_name = hash['firstName'] if hash.key? 'firstName'
        @surname = hash['surname'] if hash.key? 'surname'
      end
    end
  end
end
