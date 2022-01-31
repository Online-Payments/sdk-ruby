#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Integer] max_length
    # @attr [Integer] min_length
    class LengthValidator < OnlinePayments::SDK::DataObject
      attr_accessor :max_length
      attr_accessor :min_length

      # @return (Hash)
      def to_h
        hash = super
        hash['maxLength'] = @max_length unless @max_length.nil?
        hash['minLength'] = @min_length unless @min_length.nil?
        hash
      end

      def from_hash(hash)
        super
        @max_length = hash['maxLength'] if hash.key? 'maxLength'
        @min_length = hash['minLength'] if hash.key? 'minLength'
      end
    end
  end
end
