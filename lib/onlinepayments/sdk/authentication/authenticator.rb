module OnlinePayments
  module SDK
    module Authentication
      # Abstract class that is responsible for authenticating requests sent to the Online Payments platform.
      class Authenticator

        # Returns a value that can be used for the "Authorization" header.
        #
        # @param http_method     [String] 'GET', 'PUT', 'POST' or 'DELETE' indicating which HTTP method will be used with the request
        # @param resource_uri    [URI::HTTP] URI object that includes #path and #query of the URL that will be used, #query may be *nil*
        # @param request_headers [Array<OnlinePayments::SDK::Communication::RequestHeader>] all headers used by the request
        # @return [String] the "Authorization" header value
        def get_authorization(http_method, resource_uri, request_headers)
          raise NotImplementedError
        end
      end
    end
  end
end
