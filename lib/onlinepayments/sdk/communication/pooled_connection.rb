# frozen_string_literal: true

require 'onlinepayments/sdk/communication/connection'

module OnlinePayments
  module SDK
    module Communication
      # {OnlinePayments::SDK::Communication::Connection} that supports connection pooling. This is used to more efficiently communicate using HTTP.
      # Connection pooling means that a number of connections are kept alive after use so they can possibly be reused.
      # The methods _close_idle_connections_ and _close_expired_connections_ can be used to configure idle
      # expiration or drop connections that have expired.
      # @see OnlinePayments::SDK::Communication::DefaultConnection
      class PooledConnection < Connection
        # Configures connections idle longer than _idle_time_ seconds to be closed lazily.
        def close_idle_connections(idle_time)
          raise NotImplementedError
        end

        # Closes all connections that have expired.
        def close_expired_connections
          raise NotImplementedError
        end
      end
    end
  end
end
