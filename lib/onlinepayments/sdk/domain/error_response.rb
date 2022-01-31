#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/api_error'

module OnlinePayments::SDK
  module Domain

    # @attr [String] error_id
    # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
    class ErrorResponse < OnlinePayments::SDK::DataObject
      attr_accessor :error_id
      attr_accessor :errors

      # @return (Hash)
      def to_h
        hash = super
        hash['errorId'] = @error_id unless @error_id.nil?
        hash['errors'] = @errors.collect(&:to_h) if @errors
        hash
      end

      def from_hash(hash)
        super
        @error_id = hash['errorId'] if hash.key? 'errorId'
        if hash.key? 'errors'
          raise TypeError, "value '%s' is not an Array" % [hash['errors']] unless hash['errors'].is_a? Array
          @errors = []
          hash['errors'].each do |e|
            @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
          end
        end
      end
    end
  end
end
