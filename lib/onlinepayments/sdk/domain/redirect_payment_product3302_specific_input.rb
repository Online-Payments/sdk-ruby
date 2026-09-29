#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] organization_entity_type
      # @attr [String, nil] organization_registration_id
      # @attr [String, nil] vat_id
      class RedirectPaymentProduct3302SpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :organization_entity_type

        attr_accessor :organization_registration_id

        attr_accessor :vat_id

        # Sets the property and returns this same instance.
        def with_organization_entity_type(value)
          @organization_entity_type = value
          self
        end

        # Sets the property and returns this same instance.
        def with_organization_registration_id(value)
          @organization_registration_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_vat_id(value)
          @vat_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['organizationEntityType'] = @organization_entity_type unless @organization_entity_type.nil?
          hash['organizationRegistrationId'] = @organization_registration_id unless @organization_registration_id.nil?
          hash['vatId'] = @vat_id unless @vat_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'organizationEntityType'
            @organization_entity_type = hash['organizationEntityType']
          end
          if hash.has_key? 'organizationRegistrationId'
            @organization_registration_id = hash['organizationRegistrationId']
          end
          if hash.has_key? 'vatId'
            @vat_id = hash['vatId']
          end
        end
      end
    end
  end
end
