module OnlinePayments
  module SDK
    module JSON
      # Raised when an error occurred while marshalling/unmarshalling data to/from JSON
      class MarshallerSyntaxException < RuntimeError
      end
    end
  end
end
