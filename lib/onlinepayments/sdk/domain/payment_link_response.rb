#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_link_event'
require 'onlinepayments/sdk/domain/payment_link_order_output'

module OnlinePayments
  module SDK
    module Domain
      # @attr [DateTime] expiration_date
      # @attr [true/false] is_reusable_link
      # @attr [String] payment_id
      # @attr [Array<OnlinePayments::SDK::Domain::PaymentLinkEvent>] payment_link_events
      # @attr [String] payment_link_id
      # @attr [OnlinePayments::SDK::Domain::PaymentLinkOrderOutput] payment_link_order
      # @attr [String] recipient_name
      # @attr [String] redirection_url
      # @attr [String] status
      class PaymentLinkResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :expiration_date

        attr_accessor :is_reusable_link

        attr_accessor :payment_id

        attr_accessor :payment_link_events

        attr_accessor :payment_link_id

        attr_accessor :payment_link_order

        attr_accessor :recipient_name

        attr_accessor :redirection_url

        attr_accessor :status

        # @return (Hash)
        def to_h
          hash = super
          hash['expirationDate'] = @expiration_date.iso8601(3) unless @expiration_date.nil?
          hash['isReusableLink'] = @is_reusable_link unless @is_reusable_link.nil?
          hash['paymentId'] = @payment_id unless @payment_id.nil?
          hash['paymentLinkEvents'] = @payment_link_events.collect{|val| val.to_h} unless @payment_link_events.nil?
          hash['paymentLinkId'] = @payment_link_id unless @payment_link_id.nil?
          hash['paymentLinkOrder'] = @payment_link_order.to_h unless @payment_link_order.nil?
          hash['recipientName'] = @recipient_name unless @recipient_name.nil?
          hash['redirectionUrl'] = @redirection_url unless @redirection_url.nil?
          hash['status'] = @status unless @status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'expirationDate'
            @expiration_date = DateTime.parse(hash['expirationDate'])
          end
          if hash.has_key? 'isReusableLink'
            @is_reusable_link = hash['isReusableLink']
          end
          if hash.has_key? 'paymentId'
            @payment_id = hash['paymentId']
          end
          if hash.has_key? 'paymentLinkEvents'
            raise TypeError, "value '%s' is not an Array" % [hash['paymentLinkEvents']] unless hash['paymentLinkEvents'].is_a? Array
            @payment_link_events = []
            hash['paymentLinkEvents'].each do |e|
              @payment_link_events << OnlinePayments::SDK::Domain::PaymentLinkEvent.new_from_hash(e)
            end
          end
          if hash.has_key? 'paymentLinkId'
            @payment_link_id = hash['paymentLinkId']
          end
          if hash.has_key? 'paymentLinkOrder'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentLinkOrder']] unless hash['paymentLinkOrder'].is_a? Hash
            @payment_link_order = OnlinePayments::SDK::Domain::PaymentLinkOrderOutput.new_from_hash(hash['paymentLinkOrder'])
          end
          if hash.has_key? 'recipientName'
            @recipient_name = hash['recipientName']
          end
          if hash.has_key? 'redirectionUrl'
            @redirection_url = hash['redirectionUrl']
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
        end
      end
    end
  end
end
