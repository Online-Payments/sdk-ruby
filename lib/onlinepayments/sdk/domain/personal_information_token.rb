#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/personal_name_token'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::PersonalNameToken] name
    class PersonalInformationToken < OnlinePayments::SDK::DataObject
      attr_accessor :name

      # @return (Hash)
      def to_h
        hash = super
        hash['name'] = @name.to_h if @name
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'name'
          raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
          @name = OnlinePayments::SDK::Domain::PersonalNameToken.new_from_hash(hash['name'])
        end
      end
    end
  end
end
