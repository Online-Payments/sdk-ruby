#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] category
      # @attr [String] code
      # @attr [String] error_code
      # @attr [Integer] http_status_code
      # @attr [String] id
      # @attr [String] message
      # @attr [String] property_name
      # @attr [true/false] retriable
      class APIError < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :category

        # @deprecated Use errorCode instead. Error code
        attr_accessor :code

        attr_accessor :error_code

        attr_accessor :http_status_code

        attr_accessor :id

        attr_accessor :message

        attr_accessor :property_name

        attr_accessor :retriable

        # @return (Hash)
        def to_h
          hash = super
          hash['category'] = @category unless @category.nil?
          hash['code'] = @code unless @code.nil?
          hash['errorCode'] = @error_code unless @error_code.nil?
          hash['httpStatusCode'] = @http_status_code unless @http_status_code.nil?
          hash['id'] = @id unless @id.nil?
          hash['message'] = @message unless @message.nil?
          hash['propertyName'] = @property_name unless @property_name.nil?
          hash['retriable'] = @retriable unless @retriable.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'category'
            @category = hash['category']
          end
          if hash.has_key? 'code'
            @code = hash['code']
          end
          if hash.has_key? 'errorCode'
            @error_code = hash['errorCode']
          end
          if hash.has_key? 'httpStatusCode'
            @http_status_code = hash['httpStatusCode']
          end
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'message'
            @message = hash['message']
          end
          if hash.has_key? 'propertyName'
            @property_name = hash['propertyName']
          end
          if hash.has_key? 'retriable'
            @retriable = hash['retriable']
          end
        end
      end
    end
  end
end
