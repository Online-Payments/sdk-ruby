#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [true/false] acquirer_exemption
      # @attr [String] merchant_score
      # @attr [Integer] number_of_items
      # @attr [String] usecase
      class PaymentProduct130SpecificThreeDSecure < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :acquirer_exemption

        attr_accessor :merchant_score

        attr_accessor :number_of_items

        attr_accessor :usecase

        # @return (Hash)
        def to_h
          hash = super
          hash['acquirerExemption'] = @acquirer_exemption unless @acquirer_exemption.nil?
          hash['merchantScore'] = @merchant_score unless @merchant_score.nil?
          hash['numberOfItems'] = @number_of_items unless @number_of_items.nil?
          hash['usecase'] = @usecase unless @usecase.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'acquirerExemption'
            @acquirer_exemption = hash['acquirerExemption']
          end
          if hash.has_key? 'merchantScore'
            @merchant_score = hash['merchantScore']
          end
          if hash.has_key? 'numberOfItems'
            @number_of_items = hash['numberOfItems']
          end
          if hash.has_key? 'usecase'
            @usecase = hash['usecase']
          end
        end
      end
    end
  end
end
