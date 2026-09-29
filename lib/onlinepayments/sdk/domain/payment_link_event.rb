#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] date_time
      # @attr [String, nil] details
      # @attr [String, nil] type
      class PaymentLinkEvent < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :date_time

        attr_accessor :details

        attr_accessor :type

        # Sets the property and returns this same instance.
        def with_date_time(value)
          @date_time = value
          self
        end

        # Sets the property and returns this same instance.
        def with_details(value)
          @details = value
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
          hash['dateTime'] = @date_time unless @date_time.nil?
          hash['details'] = @details unless @details.nil?
          hash['type'] = @type unless @type.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'dateTime'
            @date_time = hash['dateTime']
          end
          if hash.has_key? 'details'
            @details = hash['details']
          end
          if hash.has_key? 'type'
            @type = hash['type']
          end
        end
      end
    end
  end
end
