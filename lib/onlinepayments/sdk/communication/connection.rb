require 'onlinepayments/sdk/logging/logging_capable'
require 'onlinepayments/sdk/logging/obfuscation/obfuscation_capable'

module OnlinePayments
  module SDK
    module Communication
      # Class used to communicate using the HTTP (or HTTPS) protocol.
      # Performs GET, DELETE, POST and PUT requests given a target uri and request headers.
      # @see OnlinePayments::SDK::Communication::DefaultConnection
      class Connection
        include OnlinePayments::SDK::Logging::LoggingCapable
        include OnlinePayments::SDK::Logging::Obfuscation::ObfuscationCapable

        # Performs a GET request to _uri_ using _request_headers_,
        # and yields the response as the status code, headers and body.
        #
        # @yield (Integer, Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO) The status code, headers and body of the response.
        def get(uri, request_headers)
          raise NotImplementedError
        end

        # Performs a DELETE request to _uri_ using _request_headers_,
        # and yields the response as the status code, headers and body.
        #
        # @yield (Integer, Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO) The status code, headers and body of the response.
        def delete(uri, request_headers)
          raise NotImplementedError
        end

        # Performs a POST request to _uri_ using _request_headers_ and _body_,
        # and yields the response as the status code, headers and body.
        #
        # @yield (Integer, Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO) The status code, headers and body of the response.
        def post(uri, request_headers, body)
          raise NotImplementedError
        end

        # Performs a PUT request to _uri_ using _request_headers_ and _body_,
        # and yields the response as the status code, headers and body.
        #
        # @yield (Integer, Array<OnlinePayments::SDK::Communication::ResponseHeader>, IO) The status code, headers and body of the response.
        def put(uri, request_headers, body)
          raise NotImplementedError
        end
      end
    end
  end
end
