#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/api_error'

module OnlinePayments::SDK
  module Domain

    # @attr [Array<OnlinePayments::SDK::Domain::APIError>] errors
    # @attr [true/false] is_authorized
    # @attr [true/false] is_cancellable
    # @attr [true/false] is_refundable
    # @attr [String] status_category
    # @attr [Integer] status_code
    # @attr [String] status_code_change_date_time
    class PaymentStatusOutput < OnlinePayments::SDK::DataObject
      attr_accessor :errors
      attr_accessor :is_authorized
      attr_accessor :is_cancellable
      attr_accessor :is_refundable
      attr_accessor :status_category
      attr_accessor :status_code
      attr_accessor :status_code_change_date_time

      # @return (Hash)
      def to_h
        hash = super
        hash['errors'] = @errors.collect(&:to_h) if @errors
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
        if hash.key? 'errors'
          raise TypeError, "value '%s' is not an Array" % [hash['errors']] unless hash['errors'].is_a? Array
          @errors = []
          hash['errors'].each do |e|
            @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
          end
        end
        @is_authorized = hash['isAuthorized'] if hash.key? 'isAuthorized'
        @is_cancellable = hash['isCancellable'] if hash.key? 'isCancellable'
        @is_refundable = hash['isRefundable'] if hash.key? 'isRefundable'
        @status_category = hash['statusCategory'] if hash.key? 'statusCategory'
        @status_code = hash['statusCode'] if hash.key? 'statusCode'
        @status_code_change_date_time = hash['statusCodeChangeDateTime'] if hash.key? 'statusCodeChangeDateTime'
      end
    end
  end
end
