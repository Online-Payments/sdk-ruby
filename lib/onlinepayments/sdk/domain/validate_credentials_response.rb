#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] result
      class ValidateCredentialsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :result

        # @return (Hash)
        def to_h
          hash = super
          hash['result'] = @result unless @result.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'result'
            @result = hash['result']
          end
        end
      end
    end
  end
end
