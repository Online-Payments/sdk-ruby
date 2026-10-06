#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/payment_product_filters_hosted_fields'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] locale
      # @attr [String, nil] origin
      # @attr [OnlinePayments::SDK::Domain::PaymentProductFiltersHostedFields, nil] payment_product_filters
      # @attr [Array<String>, nil] tokens
      class CreateHostedFieldsSessionRequest < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :locale

        attr_accessor :origin

        attr_accessor :payment_product_filters

        attr_accessor :tokens

        # Sets the property and returns this same instance.
        def with_locale(value)
          @locale = value
          self
        end

        # Sets the property and returns this same instance.
        def with_origin(value)
          @origin = value
          self
        end

        # Sets the property and returns this same instance.
        def with_payment_product_filters(value)
          @payment_product_filters = value
          self
        end

        # Sets the property and returns this same instance.
        def with_tokens(value)
          @tokens = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['locale'] = @locale unless @locale.nil?
          hash['origin'] = @origin unless @origin.nil?
          hash['paymentProductFilters'] = @payment_product_filters.to_h unless @payment_product_filters.nil?
          hash['tokens'] = @tokens unless @tokens.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'locale'
            @locale = hash['locale']
          end
          if hash.has_key? 'origin'
            @origin = hash['origin']
          end
          if hash.has_key? 'paymentProductFilters'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProductFilters']] unless hash['paymentProductFilters'].is_a? Hash
            @payment_product_filters = OnlinePayments::SDK::Domain::PaymentProductFiltersHostedFields.new_from_hash(hash['paymentProductFilters'])
          end
          if hash.has_key? 'tokens'
            raise TypeError, "value '%s' is not an Array" % [hash['tokens']] unless hash['tokens'].is_a? Array
            @tokens = []
            hash['tokens'].each do |e|
              @tokens << e
            end
          end
        end
      end
    end
  end
end
