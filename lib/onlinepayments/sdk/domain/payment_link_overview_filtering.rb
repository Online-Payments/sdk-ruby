#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<String>, nil] merchant_ids
      # @attr [Array<String>, nil] status
      class PaymentLinkOverviewFiltering < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :merchant_ids

        attr_accessor :status

        # Sets the property and returns this same instance.
        def with_merchant_ids(value)
          @merchant_ids = value
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
          hash['merchantIds'] = @merchant_ids unless @merchant_ids.nil?
          hash['status'] = @status unless @status.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'merchantIds'
            raise TypeError, "value '%s' is not an Array" % [hash['merchantIds']] unless hash['merchantIds'].is_a? Array
            @merchant_ids = []
            hash['merchantIds'].each do |e|
              @merchant_ids << e
            end
          end
          if hash.has_key? 'status'
            raise TypeError, "value '%s' is not an Array" % [hash['status']] unless hash['status'].is_a? Array
            @status = []
            hash['status'].each do |e|
              @status << e
            end
          end
        end
      end
    end
  end
end
