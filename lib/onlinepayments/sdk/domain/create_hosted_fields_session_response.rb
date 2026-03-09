#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/session_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>] invalid_tokens
      # @attr [String] sdk_sri
      # @attr [String] sdk_url
      # @attr [OnlinePayments::SDK::Domain::SessionData] session_data
      class CreateHostedFieldsSessionResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :invalid_tokens

        attr_accessor :sdk_sri

        attr_accessor :sdk_url

        attr_accessor :session_data

        # @return (Hash)
        def to_h
          hash = super
          hash['invalidTokens'] = @invalid_tokens unless @invalid_tokens.nil?
          hash['sdkSri'] = @sdk_sri unless @sdk_sri.nil?
          hash['sdkUrl'] = @sdk_url unless @sdk_url.nil?
          hash['sessionData'] = @session_data.to_h unless @session_data.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'invalidTokens'
            raise TypeError, "value '%s' is not an Array" % [hash['invalidTokens']] unless hash['invalidTokens'].is_a? Array
            @invalid_tokens = []
            hash['invalidTokens'].each do |e|
              @invalid_tokens << e
            end
          end
          if hash.has_key? 'sdkSri'
            @sdk_sri = hash['sdkSri']
          end
          if hash.has_key? 'sdkUrl'
            @sdk_url = hash['sdkUrl']
          end
          if hash.has_key? 'sessionData'
            raise TypeError, "value '%s' is not a Hash" % [hash['sessionData']] unless hash['sessionData'].is_a? Hash
            @session_data = OnlinePayments::SDK::Domain::SessionData.new_from_hash(hash['sessionData'])
          end
        end
      end
    end
  end
end
