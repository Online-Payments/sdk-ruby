#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] html_content
      class GetPrivacyPolicyResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :html_content

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
