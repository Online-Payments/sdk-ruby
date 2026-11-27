# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] issuer_id
      # @attr [String, nil] issuer_list
      # @attr [String, nil] issuer_name
      class DirectoryEntry < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :issuer_id

        attr_accessor :issuer_list

        attr_accessor :issuer_name

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(issuer_id: nil, issuer_list: nil, issuer_name: nil)
          super()
          @issuer_id = issuer_id
          @issuer_list = issuer_list
          @issuer_name = issuer_name
        end

        # Sets the property and returns this same instance.
        def with_issuer_id(value)
          @issuer_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_list(value)
          @issuer_list = value
          self
        end

        # Sets the property and returns this same instance.
        def with_issuer_name(value)
          @issuer_name = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['issuerId'] = @issuer_id unless @issuer_id.nil?
          hash['issuerList'] = @issuer_list unless @issuer_list.nil?
          hash['issuerName'] = @issuer_name unless @issuer_name.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'issuerId'
            @issuer_id = hash['issuerId']
          end
          if hash.key? 'issuerList'
            @issuer_list = hash['issuerList']
          end
          if hash.key? 'issuerName'
            @issuer_name = hash['issuerName']
          end
        end
      end
    end
  end
end
