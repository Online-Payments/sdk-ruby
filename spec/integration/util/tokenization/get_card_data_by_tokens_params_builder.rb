require 'onlinepayments/sdk/merchant/tokenization/get_card_data_by_tokens_params'

module Integration
  module Util
    module Tokenization
      class GetCardDataByTokensParamsBuilder
        def initialize
          @tokens = []
        end

        def with_tokens(tokens)
          @tokens = tokens
          self
        end

        def build
          params = OnlinePayments::SDK::Merchant::Tokenization::GetCardDataByTokensParams.new
          params.tokens = @tokens
          params
        end
      end
    end
  end
end
