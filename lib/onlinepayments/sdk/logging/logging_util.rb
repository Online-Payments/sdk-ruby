module OnlinePayments::SDK
  module Logging

    # Class responsible for obfuscating sensitive data in a message body.
    class ValueObfuscator

      class << self

        alias_method :private_new, :new

        protected :private_new, :new
      end

      public

      def self.INSTANCE
        # use lazy instantiation
        @@INSTANCE ||= ValueObfuscator.new
      end

      # Obfuscates the parameter value.
      def obfuscate_value(value)
        (value.nil? or value.empty?) ? value : "*#{value.length}"
      end
    end

    # end of ValueObfuscator

    # Class responsible for obfuscating sensitive data.
    class SensitiveValueObfuscator

      class << self

        alias_method :private_new, :new

        protected :private_new, :new
      end

      public

      def self.INSTANCE
        # use lazy instantiation
        @@INSTANCE ||= SensitiveValueObfuscator.new
      end

      # @return an arbitrary number of '*', or null/empty if the value is null/empty.
      def obfuscate_value(value)
        value.nil? or value.empty? ? value : "***"
      end
    end

    # end of SensitiveValueObfuscator

    class Obfuscator
      def initialize(obfuscators, case_insensitive)
        raise ArgumentError unless obfuscators.is_a? Hash
        @obfuscators = copy(obfuscators, case_insensitive)
      end

      private

      # case insensitive hash
      # @private
      class HashClod < Hash

        def initialize(other)
          other.each { |k, v| self.[]=(k, v) }
        end

        def [](key)
          super _insensitive(key)
        end

        def []=(key, value)
          super _insensitive(key), value
        end

        protected

        def _insensitive(key)
          key.respond_to?(:upcase) ? key.upcase : key
        end
      end

      # end of HashClod

      def copy(obfuscators, case_insensitive)
        cp = case_insensitive ? HashClod.new(obfuscators) : obfuscators
        Marshal.load(Marshal.dump(cp)) # deep copy
      end

      public

      def obfuscate_value(key, value)
        obfuscator = @obfuscators[key]
        if obfuscator.nil?
          value
        else
          obfuscator.obfuscate_value(value)
        end
      end

      # A convenient wrapper to build obfuscators
      class Builder
        attr_accessor :obfuscators

        def initialize
          raise NotImplementedError, "#{self.class.name} is not implemented."
        end

        def with_field(key)
          @obfuscators[key] = ValueObfuscator.INSTANCE
          self
        end

        def with_sensitive_field(key)
          @obfuscators[key] = SensitiveValueObfuscator.INSTANCE
          self
        end

        def build
          raise NotImplementedError, "#{self.class.name}#build() is not implemented."
        end
      end

      # Builder
    end

    # Obfuscator

    # Class that obfuscates headers of a message
    class HeaderObfuscator < Obfuscator
      def initialize(obfuscators)
        # case insensitive
        super(obfuscators, true)
      end

      def self.builder
        Builder.new
      end

      class Builder < Obfuscator::Builder
        def initialize
          @obfuscators = {}
        end

        def with_field(name)
          raise ArgumentError unless name.is_a? String
          super(name)
        end

        def with_sensitive_field(name)
          raise ArgumentError unless name.is_a? String
          super(name)
        end

        def build
          HeaderObfuscator.new(obfuscators)
        end
      end
    end

    # end of HeadObfuscator

    # Class that obfuscates properties in the JSON body of a message
    class PropertyObfuscator < Obfuscator
      def initialize(obfuscators)
        # case sensitive
        super(obfuscators, false)
        @property_pattern = build_property_pattern(obfuscators.keys)
      end

      private

      def build_property_pattern(pn)
        return /$^/ if pn.empty? # no possible match
        # Regex to create:
        # (["'])(X|Y|Z)\1\s*:\s*(?:(["'])(.*?)(?<!\\)\3|([^"'\s\[\{]\S*))
        # Groups:
        # 1: opening " or ' for the property name
        # 2: property name
        # 3: opening " or ' for the value
        # 4: quoted value
        # 5: non-quoted-value
        # The negative lookbehind is to allow escaped quotes to be part of
        # the value. What this does not allow currently is having values end
        # with a \ (which would be escaped to \\).
        regex = pn.inject("([\"'])(") { |r, p| "#{r}#{Regexp.quote(p)}|" }.chop <<
          ")\\1\\s*:\\s*(?:([\"'])(.*?)(?<!\\\\)\\3|([^\"'\\s\\[\\{]((?!,)\\S)*))"
        /#{regex}/m # dotall mode
      end

      public

      def obfuscate(body)
        return nil if body.nil?
        return "" if body.empty?

        body.gsub(@property_pattern) do
          m = Regexp.last_match
          property_name = m[2]
          value = m[4] || m[5]
          # copy value 'cause it's part of m[0]
          m[0].sub(value, obfuscate_value(property_name, value.dup))
        end
      end

      def self.builder
        Builder.new
      end

      class Builder < Obfuscator::Builder
        def initialize
          @obfuscators = {}
        end

        def with_field(property)
          raise ArgumentError unless property.is_a? String
          super(property)
        end

        def with_sensitive_field(property)
          raise ArgumentError unless property.is_a? String
          super(property)
        end

        def build
          PropertyObfuscator.new(obfuscators)
        end
      end
    end

    # end of property obfuscator

    module LoggingUtil
      @@PROPERTY_OBFUSCATOR = PropertyObfuscator.builder
                                                .with_field("cardNumber")
                                                .with_field("expiryDate")
                                                .with_field("cvv")
                                                .with_field("iban")
                                                .with_field("accountNumber")
                                                .with_field("reformattedAccountNumber")
                                                .with_field("additionalInfo")
                                                .with_field("cardholderName")
                                                .with_field("dateOfBirth")
                                                .with_field("emailAddress")
                                                .with_field("faxNumber")
                                                .with_field("firstName")
                                                .with_field("houseNumber")
                                                .with_field("mobilePhoneNumber")
                                                .with_field("passengerName")
                                                .with_field("phoneNumber")
                                                .with_field("street")
                                                .with_field("surname")
                                                .with_field("workPhoneNumber")
                                                .with_field("zip")
                                                .with_field("bin")
                                                .with_field("value")
                                                .with_sensitive_field("keyId")
                                                .with_sensitive_field("secretKey")
                                                .with_sensitive_field("publicKey")
                                                .with_sensitive_field("userAuthenticationToken")
                                                .with_sensitive_field("encryptedPayload")
                                                .with_sensitive_field("decryptedPayload")
                                                .with_sensitive_field("encryptedCustomerInput")
                                                .build

      @@HEADER_OBFUSCATOR = HeaderObfuscator.builder
                                            .with_sensitive_field("Authorization")
                                            .with_sensitive_field("WWW-Authenticate")
                                            .with_sensitive_field("Proxy-Authenticate")
                                            .with_sensitive_field("Proxy-Authorization")
                                            .with_sensitive_field("X-GCS-Authentication-Token")
                                            .with_sensitive_field("X-GCS-CallerPassword")
                                            .build

      def self.obfuscate_body(body)
        @@PROPERTY_OBFUSCATOR.obfuscate(body)
      end

      def self.obfuscate_header(name, value)
        @@HEADER_OBFUSCATOR.obfuscate_value(name, value)
      end
    end # end of LoggingUtil
  end
end
