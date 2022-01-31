require 'json'
require 'singleton'

module OnlinePayments::SDK
  module DefaultImpl
    # marshals objects to and from JSON format.
    # Currently supports marshalling and unmarshalling of classes that support class.new_from_hash and class#to_h
    class DefaultMarshaller < OnlinePayments::SDK::Marshaller
      include Singleton

      # NOTE: this alias is needed to not break existing method calls depending on old interface
      class << self
        alias_method :INSTANCE, :instance
      end

      # Marshals the _request_object_ to a JSON string using request_object#to_h
      def marshal(request_object)
        JSON.pretty_generate(request_object.to_h)
      end

      # Unmarshals a JSON string into an object of type _klass_ using klass.new_from_hash
      # @param [String] json_string
      def unmarshal(json_string, klass)
        return nil unless json_string
        return '' if json_string.empty?
        return klass.new_from_hash(JSON.parse(json_string)) if klass.respond_to?(:new_from_hash)

        raise NotImplementedError
      end
    end
  end
end
