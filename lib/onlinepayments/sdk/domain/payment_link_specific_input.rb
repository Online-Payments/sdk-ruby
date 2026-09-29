#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] description
      # @attr [DateTime, nil] expiration_date
      # @attr [String, nil] recipient_name
      class PaymentLinkSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :description

        attr_accessor :expiration_date

        attr_accessor :recipient_name

        # Sets the property and returns this same instance.
        def with_description(value)
          @description = value
          self
        end

        # Sets the property and returns this same instance.
        def with_expiration_date(value)
          @expiration_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_recipient_name(value)
          @recipient_name = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['description'] = @description unless @description.nil?
          hash['expirationDate'] = @expiration_date.iso8601(3) unless @expiration_date.nil?
          hash['recipientName'] = @recipient_name unless @recipient_name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'description'
            @description = hash['description']
          end
          if hash.has_key? 'expirationDate'
            @expiration_date = DateTime.parse(hash['expirationDate'])
          end
          if hash.has_key? 'recipientName'
            @recipient_name = hash['recipientName']
          end
        end
      end
    end
  end
end
