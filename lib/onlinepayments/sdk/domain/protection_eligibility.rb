#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] eligibility
    # @attr [String] type
    class ProtectionEligibility < OnlinePayments::SDK::DataObject
      attr_accessor :eligibility
      attr_accessor :type

      # @return (Hash)
      def to_h
        hash = super
        hash['eligibility'] = @eligibility unless @eligibility.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        super
        @eligibility = hash['eligibility'] if hash.key? 'eligibility'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
