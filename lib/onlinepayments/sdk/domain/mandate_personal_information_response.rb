#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/mandate_personal_name_response'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::MandatePersonalNameResponse] name
    # @attr [String] title
    class MandatePersonalInformationResponse < OnlinePayments::SDK::DataObject
      attr_accessor :name
      attr_accessor :title

      # @return (Hash)
      def to_h
        hash = super
        hash['name'] = @name.to_h if @name
        hash['title'] = @title unless @title.nil?
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'name'
          raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
          @name = OnlinePayments::SDK::Domain::MandatePersonalNameResponse.new_from_hash(hash['name'])
        end
        @title = hash['title'] if hash.key? 'title'
      end
    end
  end
end
