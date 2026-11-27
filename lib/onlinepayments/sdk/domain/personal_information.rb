# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/personal_name'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] date_of_birth
      # @attr [String, nil] gender
      # @attr [OnlinePayments::SDK::Domain::PersonalName, nil] name
      class PersonalInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :date_of_birth

        attr_accessor :gender

        attr_accessor :name

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(date_of_birth: nil, gender: nil, name: nil)
          super()
          @date_of_birth = date_of_birth
          @gender = gender
          @name = name
        end

        # Sets the property and returns this same instance.
        def with_date_of_birth(value)
          @date_of_birth = value
          self
        end

        # Sets the property and returns this same instance.
        def with_gender(value)
          @gender = value
          self
        end

        # Sets the property and returns this same instance.
        def with_name(value)
          @name = value
          self
        end

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
          if hash.key? 'dateOfBirth'
            @date_of_birth = hash['dateOfBirth']
          end
          if hash.key? 'gender'
            @gender = hash['gender']
          end
          if hash.key? 'name'
            raise TypeError, "value '#{hash['name']}' is not a Hash" unless hash['name'].is_a? Hash
            @name = OnlinePayments::SDK::Domain::PersonalName.new_from_hash(hash['name'])
          end
        end
      end
    end
  end
end
