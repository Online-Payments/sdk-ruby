#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] html_content
    class GetPrivacyPolicyResponse < OnlinePayments::SDK::DataObject
      attr_accessor :html_content

      # @return (Hash)
      def to_h
        hash = super
        hash['htmlContent'] = @html_content unless @html_content.nil?
        hash
      end

      def from_hash(hash)
        super
        @html_content = hash['htmlContent'] if hash.key? 'htmlContent'
      end
    end
  end
end
