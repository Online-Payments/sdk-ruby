require 'json'
require 'singleton'
require 'onlinepayments/sdk/json/marshaller'

module OnlinePayments
  module SDK
    module JSON
      # Marshals objects to and from JSON format.
      # Currently supports marshalling and unmarshalling of classes that support class.new_from_hash and class#to_h
      class DefaultMarshaller < Marshaller
        include Singleton

        # Marshals the _request_object_ to a JSON string using request_object#to_h
        def marshal(request_object)
          return 'null' if request_object.nil?
          ::JSON.pretty_generate(request_object.to_h)
        end

        # Unmarshals a JSON string into an object of type _klass_ using klass.new_from_hash
        def unmarshal(json_string, klass)
          return nil if json_string.nil? || json_string.empty?
          if klass.respond_to?(:new_from_hash)
            klass.new_from_hash(::JSON.load(json_string))
          else
            raise NotImplementedError
          end
        rescue ::JSON::ParserError => e
          raise MarshallerSyntaxException, e.message
        end
      end
    end
  end
end
