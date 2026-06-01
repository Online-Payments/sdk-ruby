#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] detail
      # @attr [String] instance
      # @attr [Integer] status
      # @attr [String] title
      # @attr [String] type
      class ProblemDetailsResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :detail

        attr_accessor :instance

        attr_accessor :status

        attr_accessor :title

        attr_accessor :type

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
          if hash.has_key? 'detail'
            @detail = hash['detail']
          end
          if hash.has_key? 'instance'
            @instance = hash['instance']
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'title'
            @title = hash['title']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
