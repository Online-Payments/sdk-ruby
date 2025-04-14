#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] first_name
      # @attr [String] surname
      # @attr [String] title
      class PersonalName < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :first_name

        attr_accessor :surname

        attr_accessor :title

        # @return (Hash)
        def to_h
          hash = super
          hash['firstName'] = @first_name unless @first_name.nil?
          hash['surname'] = @surname unless @surname.nil?
          hash['title'] = @title unless @title.nil?
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
          if hash.has_key? 'title'
            @title = hash['title']
          end
        end
      end
    end
  end
end
