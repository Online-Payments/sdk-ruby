#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/mandate_personal_name'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::MandatePersonalName] name
      # @attr [String] title
      class MandatePersonalInformation < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :name

        attr_accessor :title

        # @return (Hash)
        def to_h
          hash = super
          hash['name'] = @name.to_h unless @name.nil?
          hash['title'] = @title unless @title.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'name'
            raise TypeError, "value '%s' is not a Hash" % [hash['name']] unless hash['name'].is_a? Hash
            @name = OnlinePayments::SDK::Domain::MandatePersonalName.new_from_hash(hash['name'])
          end
          if hash.has_key? 'title'
            @title = hash['title']
          end
        end
      end
    end
  end
end
