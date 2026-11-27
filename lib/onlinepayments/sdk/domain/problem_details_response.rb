# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] detail
      # @attr [String, nil] instance
      # @attr [Integer, nil] status
      # @attr [String, nil] title
      # @attr [String, nil] type
      class ProblemDetailsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :detail

        attr_accessor :instance

        attr_accessor :status

        attr_accessor :title

        attr_accessor :type

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(detail: nil, instance: nil, status: nil, title: nil, type: nil)
          super()
          @detail = detail
          @instance = instance
          @status = status
          @title = title
          @type = type
        end

        # Sets the property and returns this same instance.
        def with_detail(value)
          @detail = value
          self
        end

        # Sets the property and returns this same instance.
        def with_instance(value)
          @instance = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_title(value)
          @title = value
          self
        end

        # Sets the property and returns this same instance.
        def with_type(value)
          @type = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['detail'] = @detail unless @detail.nil?
          hash['instance'] = @instance unless @instance.nil?
          hash['status'] = @status unless @status.nil?
          hash['title'] = @title unless @title.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'detail'
            @detail = hash['detail']
          end
          if hash.key? 'instance'
            @instance = hash['instance']
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'title'
            @title = hash['title']
          end
          if hash.key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
