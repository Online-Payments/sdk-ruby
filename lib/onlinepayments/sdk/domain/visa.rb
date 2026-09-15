#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/visa_authentication_options'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::VisaAuthenticationOptions, nil] authentication_options
      # @attr [String, nil] encryption_key
      # @attr [String, nil] n_modulus
      # @attr [String, nil] src_initiator_id
      # @attr [String, nil] srci_dpa_id
      class Visa < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :authentication_options

        attr_accessor :encryption_key

        attr_accessor :n_modulus

        attr_accessor :src_initiator_id

        attr_accessor :srci_dpa_id

        # @return (Hash)
        def to_h
          hash = super
          hash['authenticationOptions'] = @authentication_options.to_h unless @authentication_options.nil?
          hash['encryptionKey'] = @encryption_key unless @encryption_key.nil?
          hash['nModulus'] = @n_modulus unless @n_modulus.nil?
          hash['srcInitiatorId'] = @src_initiator_id unless @src_initiator_id.nil?
          hash['srciDpaId'] = @srci_dpa_id unless @srci_dpa_id.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'authenticationOptions'
            raise TypeError, "value '%s' is not a Hash" % [hash['authenticationOptions']] unless hash['authenticationOptions'].is_a? Hash
            @authentication_options = OnlinePayments::SDK::Domain::VisaAuthenticationOptions.new_from_hash(hash['authenticationOptions'])
          end
          if hash.has_key? 'encryptionKey'
            @encryption_key = hash['encryptionKey']
          end
          if hash.has_key? 'nModulus'
            @n_modulus = hash['nModulus']
          end
          if hash.has_key? 'srcInitiatorId'
            @src_initiator_id = hash['srcInitiatorId']
          end
          if hash.has_key? 'srciDpaId'
            @srci_dpa_id = hash['srciDpaId']
          end
        end
      end
    end
  end
end
