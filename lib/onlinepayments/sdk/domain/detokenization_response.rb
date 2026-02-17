#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/detokenized_token_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::DetokenizedTokenResponse>] tokens
      class DetokenizationResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :tokens

        # @return (Hash)
        def to_h
          hash = super
          hash['tokens'] = @tokens.collect{|val| val.to_h} unless @tokens.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'tokens'
            raise TypeError, "value '%s' is not an Array" % [hash['tokens']] unless hash['tokens'].is_a? Array
            @tokens = []
            hash['tokens'].each do |e|
              @tokens << OnlinePayments::SDK::Domain::DetokenizedTokenResponse.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
