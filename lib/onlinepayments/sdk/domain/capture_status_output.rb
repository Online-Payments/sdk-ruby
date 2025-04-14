#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] status_code
      class CaptureStatusOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :status_code

        # @return (Hash)
        def to_h
          hash = super
          hash['statusCode'] = @status_code unless @status_code.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'statusCode'
            @status_code = hash['statusCode']
          end
        end
      end
    end
  end
end
