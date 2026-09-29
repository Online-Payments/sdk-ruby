#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] display_name
      # @attr [String, nil] domain_name
      class PaymentProductSession302SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :display_name

        attr_accessor :domain_name

        # Sets the property and returns this same instance.
        def with_display_name(value)
          @display_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_domain_name(value)
          @domain_name = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['displayName'] = @display_name unless @display_name.nil?
          hash['domainName'] = @domain_name unless @domain_name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'displayName'
            @display_name = hash['displayName']
          end
          if hash.has_key? 'domainName'
            @domain_name = hash['domainName']
          end
        end
      end
    end
  end
end
