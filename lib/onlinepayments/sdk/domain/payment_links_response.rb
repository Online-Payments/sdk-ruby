#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_link_response'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentLinkResponse>] payment_links
      class PaymentLinksResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_links

        # @return (Hash)
        def to_h
          hash = super
          hash['PaymentLinks'] = @payment_links.collect{|val| val.to_h} unless @payment_links.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'PaymentLinks'
            raise TypeError, "value '%s' is not an Array" % [hash['PaymentLinks']] unless hash['PaymentLinks'].is_a? Array
            @payment_links = []
            hash['PaymentLinks'].each do |e|
              @payment_links << OnlinePayments::SDK::Domain::PaymentLinkResponse.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
