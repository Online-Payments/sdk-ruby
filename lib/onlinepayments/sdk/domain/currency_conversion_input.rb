#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [true/false] accepted_by_user
    # @attr [String] dcc_session_id
    class CurrencyConversionInput < OnlinePayments::SDK::DataObject
      attr_accessor :accepted_by_user
      attr_accessor :dcc_session_id

      # @return (Hash)
      def to_h
        hash = super
        hash['acceptedByUser'] = @accepted_by_user unless @accepted_by_user.nil?
        hash['dccSessionId'] = @dcc_session_id unless @dcc_session_id.nil?
        hash
      end

      def from_hash(hash)
        super
        @accepted_by_user = hash['acceptedByUser'] if hash.key? 'acceptedByUser'
        @dcc_session_id = hash['dccSessionId'] if hash.key? 'dccSessionId'
      end
    end
  end
end
