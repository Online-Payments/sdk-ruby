#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>, nil] errors
      # @attr [true/false, nil] is_authorized
      # @attr [true/false, nil] is_cancellable
      # @attr [true/false, nil] is_refundable
      # @attr [String, nil] status_category
      # @attr [Integer, nil] status_code
      # @attr [String, nil] status_code_change_date_time
      class PaymentStatusOutput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :errors

        attr_accessor :is_authorized

        attr_accessor :is_cancellable

        attr_accessor :is_refundable

        attr_accessor :status_category

        attr_accessor :status_code

        attr_accessor :status_code_change_date_time

        # Sets the property and returns this same instance.
        def with_errors(value)
          @errors = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_authorized(value)
          @is_authorized = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_cancellable(value)
          @is_cancellable = value
          self
        end

        # Sets the property and returns this same instance.
        def with_is_refundable(value)
          @is_refundable = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_category(value)
          @status_category = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_code(value)
          @status_code = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_code_change_date_time(value)
          @status_code_change_date_time = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['errors'] = @errors.collect{|val| val.to_h} unless @errors.nil?
          hash['isAuthorized'] = @is_authorized unless @is_authorized.nil?
          hash['isCancellable'] = @is_cancellable unless @is_cancellable.nil?
          hash['isRefundable'] = @is_refundable unless @is_refundable.nil?
          hash['statusCategory'] = @status_category unless @status_category.nil?
          hash['statusCode'] = @status_code unless @status_code.nil?
          hash['statusCodeChangeDateTime'] = @status_code_change_date_time unless @status_code_change_date_time.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'errors'
            raise TypeError, "value '%s' is not an Array" % [hash['errors']] unless hash['errors'].is_a? Array
            @errors = []
            hash['errors'].each do |e|
              @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
            end
          end
          if hash.has_key? 'isAuthorized'
            @is_authorized = hash['isAuthorized']
          end
          if hash.has_key? 'isCancellable'
            @is_cancellable = hash['isCancellable']
          end
          if hash.has_key? 'isRefundable'
            @is_refundable = hash['isRefundable']
          end
          if hash.has_key? 'statusCategory'
            @status_category = hash['statusCategory']
          end
          if hash.has_key? 'statusCode'
            @status_code = hash['statusCode']
          end
          if hash.has_key? 'statusCodeChangeDateTime'
            @status_code_change_date_time = hash['statusCodeChangeDateTime']
          end
        end
      end
    end
  end
end
