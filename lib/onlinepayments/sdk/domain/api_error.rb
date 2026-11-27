# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] category
      # @attr [String, nil] code
      # @attr [String, nil] error_code
      # @attr [Integer, nil] http_status_code
      # @attr [String, nil] id
      # @attr [String, nil] message
      # @attr [String, nil] property_name
      # @attr [true/false, nil] retriable
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

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(category: nil, code: nil, error_code: nil, http_status_code: nil, id: nil, message: nil, property_name: nil, retriable: nil)
          super()
          @category = category
          @code = code
          @error_code = error_code
          @http_status_code = http_status_code
          @id = id
          @message = message
          @property_name = property_name
          @retriable = retriable
        end

        # Sets the property and returns this same instance.
        def with_category(value)
          @category = value
          self
        end

        # Sets the property and returns this same instance.
        def with_code(value)
          @code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_error_code(value)
          @error_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_http_status_code(value)
          @http_status_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_message(value)
          @message = value
          self
        end

        # Sets the property and returns this same instance.
        def with_property_name(value)
          @property_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_retriable(value)
          @retriable = value
          self
        end

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
          if hash.key? 'category'
            @category = hash['category']
          end
          if hash.key? 'code'
            @code = hash['code']
          end
          if hash.key? 'errorCode'
            @error_code = hash['errorCode']
          end
          if hash.key? 'httpStatusCode'
            @http_status_code = hash['httpStatusCode']
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'message'
            @message = hash['message']
          end
          if hash.key? 'propertyName'
            @property_name = hash['propertyName']
          end
          if hash.key? 'retriable'
            @retriable = hash['retriable']
          end
        end
      end
    end
  end
end
