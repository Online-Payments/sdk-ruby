# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/authentication_options'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AuthenticationOptions, nil] authentication_options
      # @attr [String, nil] src_initiator_id
      # @attr [String, nil] srci_dpa_id
      class Mastercard < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authentication_options

        attr_accessor :src_initiator_id

        attr_accessor :srci_dpa_id

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(authentication_options: nil, src_initiator_id: nil, srci_dpa_id: nil)
          super()
          @authentication_options = authentication_options
          @src_initiator_id = src_initiator_id
          @srci_dpa_id = srci_dpa_id
        end

        # Sets the property and returns this same instance.
        def with_authentication_options(value)
          @authentication_options = value
          self
        end

        # Sets the property and returns this same instance.
        def with_src_initiator_id(value)
          @src_initiator_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_srci_dpa_id(value)
          @srci_dpa_id = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['authenticationOptions'] = @authentication_options.to_h unless @authentication_options.nil?
          hash['srcInitiatorId'] = @src_initiator_id unless @src_initiator_id.nil?
          hash['srciDpaId'] = @srci_dpa_id unless @srci_dpa_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'authenticationOptions'
            raise TypeError, "value '#{hash['authenticationOptions']}' is not a Hash" unless hash['authenticationOptions'].is_a? Hash
            @authentication_options = OnlinePayments::SDK::Domain::AuthenticationOptions.new_from_hash(hash['authenticationOptions'])
          end
          if hash.key? 'srcInitiatorId'
            @src_initiator_id = hash['srcInitiatorId']
          end
          if hash.key? 'srciDpaId'
            @srci_dpa_id = hash['srciDpaId']
          end
        end
      end
    end
  end
end
