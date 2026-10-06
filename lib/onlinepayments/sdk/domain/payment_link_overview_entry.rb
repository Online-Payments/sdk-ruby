#
# This file was automatically generated.
#
require 'date'

require 'onlinepayments/sdk/domain/amount_of_money'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::AmountOfMoney, nil] amount
      # @attr [String, nil] created_by
      # @attr [DateTime, nil] creation_date
      # @attr [DateTime, nil] expiration_date
      # @attr [true/false, nil] is_reusable_link
      # @attr [String, nil] merchant_id
      # @attr [String, nil] merchant_reference
      # @attr [String, nil] payment_link_id
      # @attr [String, nil] redirection_url
      # @attr [String, nil] status
      class PaymentLinkOverviewEntry < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :amount

        attr_accessor :created_by

        attr_accessor :creation_date

        attr_accessor :expiration_date

        attr_accessor :is_reusable_link

        attr_accessor :merchant_id

        attr_accessor :merchant_reference

        attr_accessor :payment_link_id

        attr_accessor :redirection_url

        attr_accessor :status

        # Sets the property and returns this same instance.
        def with_amount(value)
          @amount = value
          self
        end

        # Sets the property and returns this same instance.
        def with_created_by(value)
          @created_by = value
          self
        end

        # Sets the property and returns this same instance.
        def with_creation_date(value)
          @creation_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_expiration_date(value)
          @expiration_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_reusable_link(value)
          @is_reusable_link = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_id(value)
          @merchant_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_merchant_reference(value)
          @merchant_reference = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_link_id(value)
          @payment_link_id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_redirection_url(value)
          @redirection_url = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['amount'] = @amount.to_h unless @amount.nil?
          hash['createdBy'] = @created_by unless @created_by.nil?
          hash['creationDate'] = @creation_date.iso8601(3) unless @creation_date.nil?
          hash['expirationDate'] = @expiration_date.iso8601(3) unless @expiration_date.nil?
          hash['isReusableLink'] = @is_reusable_link unless @is_reusable_link.nil?
          hash['merchantId'] = @merchant_id unless @merchant_id.nil?
          hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
          hash['paymentLinkId'] = @payment_link_id unless @payment_link_id.nil?
          hash['redirectionUrl'] = @redirection_url unless @redirection_url.nil?
          hash['status'] = @status unless @status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'amount'
            raise TypeError, "value '%s' is not a Hash" % [hash['amount']] unless hash['amount'].is_a? Hash
            @amount = OnlinePayments::SDK::Domain::AmountOfMoney.new_from_hash(hash['amount'])
          end
          if hash.has_key? 'createdBy'
            @created_by = hash['createdBy']
          end
          if hash.has_key? 'creationDate'
            @creation_date = DateTime.parse(hash['creationDate'])
          end
          if hash.has_key? 'expirationDate'
            @expiration_date = DateTime.parse(hash['expirationDate'])
          end
          if hash.has_key? 'isReusableLink'
            @is_reusable_link = hash['isReusableLink']
          end
          if hash.has_key? 'merchantId'
            @merchant_id = hash['merchantId']
          end
          if hash.has_key? 'merchantReference'
            @merchant_reference = hash['merchantReference']
          end
          if hash.has_key? 'paymentLinkId'
            @payment_link_id = hash['paymentLinkId']
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
