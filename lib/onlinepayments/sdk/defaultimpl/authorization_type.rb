module OnlinePayments::SDK
  module DefaultImpl

    # Contains all authentication schemes supported by the GlobabCollect platform.
    class AuthorizationType
      V1HMAC = 'v1HMAC'

      # @return [String] the authorization string that belongs to the parameter _authorization_, or _nil_ if not found.
      def self.get_authorization(authorization)
        case authorization.downcase
        when V1HMAC.downcase
          return V1HMAC
        else
          raise ArgumentError "Unknown authorization type '#{authorization}'"
        end
      end

      # @return [String]
      def self.get_signature_string
        V1HMAC
      end
    end
  end
end
