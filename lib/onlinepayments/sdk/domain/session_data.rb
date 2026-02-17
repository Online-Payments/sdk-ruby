#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] hosted_fields_session_id
      # @attr [String] locale
      # @attr [String] platform_url
      # @attr [String] session_token
      # @attr [Array<String>] tokens
      class SessionData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :hosted_fields_session_id

        attr_accessor :locale

        attr_accessor :platform_url

        attr_accessor :session_token

        attr_accessor :tokens

        # @return (Hash)
        def to_h
          hash = super
          hash['hostedFieldsSessionId'] = @hosted_fields_session_id unless @hosted_fields_session_id.nil?
          hash['locale'] = @locale unless @locale.nil?
          hash['platformUrl'] = @platform_url unless @platform_url.nil?
          hash['sessionToken'] = @session_token unless @session_token.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'hostedFieldsSessionId'
            @hosted_fields_session_id = hash['hostedFieldsSessionId']
          end
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'platformUrl'
            @platform_url = hash['platformUrl']
          end
          if hash.has_key? 'sessionToken'
            @session_token = hash['sessionToken']
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
