#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] locale
      # @attr [Array<String>] tokens
      class CreateHostedFieldsSessionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :locale

        attr_accessor :tokens

        # @return (Hash)
        def to_h
          hash = super
          hash['locale'] = @locale unless @locale.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'tokens'
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
end
