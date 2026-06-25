require 'onlinepayments/sdk/merchant/tokenization/get_card_data_by_payments_params'

module Integration
  module Util
    module Tokenization
      class GetCardDataByPaymentsParamsBuilder
        def initialize
          @payments = []
        end

        def with_payments(payments)
          @payments = payments
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::Tokenization::GetCardDataByPaymentsParams.new
          params.payments = @payments
          params
        end
      end
  end
end
end
