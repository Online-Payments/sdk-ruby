require 'English'
require 'singleton'
require 'onlinepayments/sdk/logging/communicator_logger'

module OnlinePayments
  module SDK
    module Logging
      # Logging class that logs the messages to $stdout.
      class StdoutCommunicatorLogger < CommunicatorLogger
        include Singleton

        def initialize
          # implement the interface
        end

        # Logs a single error or non-error message to $stdout.
        def log(msg, thrown = nil)
          $stdout.puts get_date_prefix + msg
          $stdout.puts thrown.to_s if thrown
          $stdout.puts thrown.backtrace.join($RS) if thrown
        end

        private

        def get_date_prefix
          Time.now.strftime("%Y-%m-%dT%H:%M:%S ")
        end
      end
    end
  end
end
