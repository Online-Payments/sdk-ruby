#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] html_content
      class GetPrivacyPolicyResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :html_content

        # Sets the property and returns this same instance.
        def with_html_content(value)
          @html_content = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['htmlContent'] = @html_content unless @html_content.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'htmlContent'
            @html_content = hash['htmlContent']
          end
        end
      end
    end
  end
end
