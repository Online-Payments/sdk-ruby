# frozen_string_literal: true

module OnlinePayments
  module SDK
    module Authentication
      # Contains all authentication schemes supported by the Online Payments platform.
      class AuthorizationType
        V1HMAC = 'v1HMAC'

        # @return [String] the authorization string that belongs to the parameter _authorization_, or _nil_ if not found.
        def self.get_authorization(authorization)
          authorization if authorization == 'v1HMAC'
        end
      end
    end
  end
end
