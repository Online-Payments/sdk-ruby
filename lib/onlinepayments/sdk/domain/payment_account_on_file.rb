# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String, nil] create_date
      # @attr [Integer, nil] number_of_card_on_file_creation_attempts_last24_hours
      class PaymentAccountOnFile < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :create_date

        attr_accessor :number_of_card_on_file_creation_attempts_last24_hours

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(create_date: nil, number_of_card_on_file_creation_attempts_last24_hours: nil)
          super()
          @create_date = create_date
          @number_of_card_on_file_creation_attempts_last24_hours = number_of_card_on_file_creation_attempts_last24_hours
        end

        # Sets the property and returns this same instance.
        def with_create_date(value)
          @create_date = value
          self
        end

        # Sets the property and returns this same instance.
        def with_number_of_card_on_file_creation_attempts_last24_hours(value)
          @number_of_card_on_file_creation_attempts_last24_hours = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['createDate'] = @create_date unless @create_date.nil?
          hash['numberOfCardOnFileCreationAttemptsLast24Hours'] = @number_of_card_on_file_creation_attempts_last24_hours unless @number_of_card_on_file_creation_attempts_last24_hours.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'createDate'
            @create_date = hash['createDate']
          end
          if hash.key? 'numberOfCardOnFileCreationAttemptsLast24Hours'
            @number_of_card_on_file_creation_attempts_last24_hours = hash['numberOfCardOnFileCreationAttemptsLast24Hours']
          end
        end
      end
    end
  end
end
