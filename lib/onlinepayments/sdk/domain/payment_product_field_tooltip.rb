#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] image
      # @attr [String] label
      class PaymentProductFieldTooltip < OnlinePayments::SDK::Domain::DataObject

        # @deprecated This field is not used by any payment product Relative URL that can be used to retrieve an image for the tooltip image.
        attr_accessor :image

        attr_accessor :label

        # @return (Hash)
        def to_h
          hash = super
          hash['image'] = @image unless @image.nil?
          hash['label'] = @label unless @label.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'image'
            @image = hash['image']
          end
          if hash.has_key? 'label'
            @label = hash['label']
          end
        end
      end
    end
  end
end
