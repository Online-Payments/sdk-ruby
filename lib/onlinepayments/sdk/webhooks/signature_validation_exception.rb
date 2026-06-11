module OnlinePayments
  module SDK
    module Webhooks
      # Raised when an error occurred when validating Webhooks signatures
      class SignatureValidationException < RuntimeError

        # Creates a new SignatureValidationException
        #
        # @param [Hash] args the options to create the Exception with
        # @option args [String] :message the error message
        # @option args [RuntimeError] :cause an Error object that causes the Exception
        def initialize(args)
          msg = args[:message]
          msg = args[:cause].to_s if msg.nil? && !args[:cause].nil?
          super(msg)
          # store backtrace info if exception given
          set_backtrace(args[:cause].backtrace) unless args[:cause].nil?
        end
      end
    end
  end
end
