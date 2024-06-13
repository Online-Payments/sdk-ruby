#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [String] template
    class PageCustomization < OnlinePayments::SDK::DataObject
      attr_accessor :template

      # @return (Hash)
      def to_h
        hash = super
        hash['template'] = @template unless @template.nil?
        hash
      end

      def from_hash(hash)
        super
        @template = hash['template'] if hash.key? 'template'
      end
    end
  end
end
