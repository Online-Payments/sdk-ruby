#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] first_name
      # @attr [String, nil] surname
      class MandatePersonalNameResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :first_name

        attr_accessor :surname

        # Sets the property and returns this same instance.
        def with_first_name(value)
          @first_name = value
          self
        end

        # Sets the property and returns this same instance.
        def with_surname(value)
          @surname = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['firstName'] = @first_name unless @first_name.nil?
          hash['surname'] = @surname unless @surname.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'firstName'
            @first_name = hash['firstName']
          end
          if hash.has_key? 'surname'
            @surname = hash['surname']
          end
        end
      end
    end
  end
end
