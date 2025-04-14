#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/personal_name_token'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::PersonalNameToken] name
      class PersonalInformationToken < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :name

        # @return (Hash)
        def to_h
          hash = super
          hash['name'] = @name.to_h unless @name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'name'
            raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
            @name = OnlinePayments::SDK::Domain::PersonalNameToken.new_from_hash(hash['name'])
          end
        end
      end
    end
  end
end
