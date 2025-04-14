#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/personal_name'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] date_of_birth
      # @attr [String] gender
      # @attr [OnlinePayments::SDK::Domain::PersonalName] name
      class PersonalInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :date_of_birth

        attr_accessor :gender

        attr_accessor :name

        # @return (Hash)
        def to_h
          hash = super
          hash['dateOfBirth'] = @date_of_birth unless @date_of_birth.nil?
          hash['gender'] = @gender unless @gender.nil?
          hash['name'] = @name.to_h unless @name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'dateOfBirth'
            @date_of_birth = hash['dateOfBirth']
          end
          if hash.has_key? 'gender'
            @gender = hash['gender']
          end
          if hash.has_key? 'name'
            raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
            @name = OnlinePayments::SDK::Domain::PersonalName.new_from_hash(hash['name'])
          end
        end
      end
    end
  end
end
