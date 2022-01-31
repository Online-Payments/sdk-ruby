#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/personal_name'

module OnlinePayments::SDK
  module Domain

    # @attr [String] date_of_birth
    # @attr [String] gender
    # @attr [OnlinePayments::SDK::Domain::PersonalName] name
    class PersonalInformation < OnlinePayments::SDK::DataObject
      attr_accessor :date_of_birth
      attr_accessor :gender
      attr_accessor :name

      # @return (Hash)
      def to_h
        hash = super
        hash['dateOfBirth'] = @date_of_birth unless @date_of_birth.nil?
        hash['gender'] = @gender unless @gender.nil?
        hash['name'] = @name.to_h if @name
        hash
      end

      def from_hash(hash)
        super
        @date_of_birth = hash['dateOfBirth'] if hash.key? 'dateOfBirth'
        @gender = hash['gender'] if hash.key? 'gender'
        if hash.key? 'name'
          raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
          @name = OnlinePayments::SDK::Domain::PersonalName.new_from_hash(hash['name'])
        end
      end
    end
  end
end
