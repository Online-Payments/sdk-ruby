#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/airline_data'
require 'onlinepayments/sdk/domain/loan_recipient'
require 'onlinepayments/sdk/domain/lodging_data'
require 'onlinepayments/sdk/domain/order_type_information'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::AirlineData] airline_data
    # @attr [OnlinePayments::SDK::Domain::LoanRecipient] loan_recipient
    # @attr [OnlinePayments::SDK::Domain::LodgingData] lodging_data
    # @attr [OnlinePayments::SDK::Domain::OrderTypeInformation] type_information
    class AdditionalOrderInput < OnlinePayments::SDK::DataObject
      attr_accessor :airline_data
      attr_accessor :loan_recipient
      attr_accessor :lodging_data
      attr_accessor :type_information

      # @return (Hash)
      def to_h
        hash = super
        hash['airlineData'] = @airline_data.to_h if @airline_data
        hash['loanRecipient'] = @loan_recipient.to_h if @loan_recipient
        hash['lodgingData'] = @lodging_data.to_h if @lodging_data
        hash['typeInformation'] = @type_information.to_h if @type_information
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'airlineData'
          raise TypeError, "value '%s' is not a Hash" % [hash['airlineData']] unless hash['airlineData'].is_a? Hash
          @airline_data = OnlinePayments::SDK::Domain::AirlineData.new_from_hash(hash['airlineData'])
        end
        if hash.key? 'loanRecipient'
          raise TypeError, "value '%s' is not a Hash" % [hash['loanRecipient']] unless hash['loanRecipient'].is_a? Hash
          @loan_recipient = OnlinePayments::SDK::Domain::LoanRecipient.new_from_hash(hash['loanRecipient'])
        end
        if hash.key? 'lodgingData'
          raise TypeError, "value '%s' is not a Hash" % [hash['lodgingData']] unless hash['lodgingData'].is_a? Hash
          @lodging_data = OnlinePayments::SDK::Domain::LodgingData.new_from_hash(hash['lodgingData'])
        end
        if hash.key? 'typeInformation'
          raise TypeError, "value '%s' is not a Hash" % [hash['typeInformation']] unless hash['typeInformation'].is_a? Hash
          @type_information = OnlinePayments::SDK::Domain::OrderTypeInformation.new_from_hash(hash['typeInformation'])
        end
      end
    end
  end
end
