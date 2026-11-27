# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/api_error'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::APIError>, nil] errors
      # @attr [String, nil] status_category
      # @attr [Integer, nil] status_code
      # @attr [String, nil] status_code_change_date_time
      class PaymentStatusOutputSummary < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :errors

        attr_accessor :status_category

        attr_accessor :status_code

        attr_accessor :status_code_change_date_time

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(errors: nil, status_category: nil, status_code: nil, status_code_change_date_time: nil)
          super()
          @errors = errors
          @status_category = status_category
          @status_code = status_code
          @status_code_change_date_time = status_code_change_date_time
        end

        # Sets the property and returns this same instance.
        def with_errors(value)
          @errors = value
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
          hash['statusCategory'] = @status_category unless @status_category.nil?
          hash['statusCode'] = @status_code unless @status_code.nil?
          hash['statusCodeChangeDateTime'] = @status_code_change_date_time unless @status_code_change_date_time.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'errors'
            raise TypeError, "value '#{hash['errors']}' is not an Array" unless hash['errors'].is_a? Array
            @errors = []
            hash['errors'].each do |e|
              @errors << OnlinePayments::SDK::Domain::APIError.new_from_hash(e)
            end
          end
          if hash.key? 'statusCategory'
            @status_category = hash['statusCategory']
          end
          if hash.key? 'statusCode'
            @status_code = hash['statusCode']
          end
          if hash.key? 'statusCodeChangeDateTime'
            @status_code_change_date_time = hash['statusCodeChangeDateTime']
          end
        end
      end
    end
  end
end
