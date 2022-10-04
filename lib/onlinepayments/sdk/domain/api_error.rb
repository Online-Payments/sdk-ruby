#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] category
    # @attr [String] code
    # @attr [String] error_code
    # @attr [Integer] http_status_code
    # @attr [String] id
    # @attr [String] message
    # @attr [String] property_name
    # @attr [true/false] retriable
    class APIError < OnlinePayments::SDK::DataObject
      attr_accessor :category
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
        @category = hash['category'] if hash.key? 'category'
        @code = hash['code'] if hash.key? 'code'
        @error_code = hash['errorCode'] if hash.key? 'errorCode'
        @http_status_code = hash['httpStatusCode'] if hash.key? 'httpStatusCode'
        @id = hash['id'] if hash.key? 'id'
        @message = hash['message'] if hash.key? 'message'
        @property_name = hash['propertyName'] if hash.key? 'propertyName'
        @retriable = hash['retriable'] if hash.key? 'retriable'
      end
    end
  end
end
