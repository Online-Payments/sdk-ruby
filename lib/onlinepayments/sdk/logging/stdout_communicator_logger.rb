require 'English'
require 'singleton'

module OnlinePayments::SDK
  module Logging

    # {OnlinePayments::SDK::Logging::CommunicatorLogger} that logs the messages to $stdout.
    class StdoutCommunicatorLogger < CommunicatorLogger
      include Singleton

      def initialize
        # implement the interface
      end

      # NOTE: this alias is needed to not break existing method calls depending on old interface
      class << self
        alias_method :INSTANCE, :instance
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
