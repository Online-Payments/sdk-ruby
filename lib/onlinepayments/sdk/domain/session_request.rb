#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<String>] tokens
    class SessionRequest < OnlinePayments::SDK::DataObject
      attr_accessor :tokens

      # @return (Hash)
      def to_h
        hash = super
        hash['tokens'] = @tokens unless @tokens.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'tokens'
          raise TypeError, "value '%s' is not an Array" % [hash['tokens']] unless hash['tokens'].is_a? Array
          @tokens = []
          hash['tokens'].each do |e|
            @tokens << e
          end
        end
      end
    end
  end
end
