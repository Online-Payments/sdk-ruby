#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] error_id
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
      class ErrorResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :error_id

        attr_accessor :errors

        # @return (Hash)
        def to_h
          hash = super
          hash['errorId'] = @error_id unless @error_id.nil?
          hash['errors'] = @errors.collect{|val| val.to_h} unless @errors.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'errorId'
            @error_id = hash['errorId']
          end
          if hash.has_key? 'errors'
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
end
