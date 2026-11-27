# frozen_string_literal: true

require 'onlinepayments/sdk/logging/obfuscation/obfuscation_rule'

module OnlinePayments
  module SDK
    module Logging
      module Obfuscation
        # A class that can be used to obfuscate properties in JSON bodies.
        class BodyObfuscator
          # Creates a new body obfuscator.
          # This will contain some pre-defined obfuscation rules, as well as any provided custom rules
          #
          # @param additional_rules [Hash] An optional hash where the keys are property names and the values are
          #        functions that obfuscate a single value
          def initialize(additional_rules = nil)
            @obfuscation_rules = {
              'additionalInfo' => Obfuscation.obfuscate_all,
              'cardholderName' => Obfuscation.obfuscate_all,
              'dateOfBirth' => Obfuscation.obfuscate_all,
              'emailAddress' => Obfuscation.obfuscate_all,
              'faxNumber' => Obfuscation.obfuscate_all,
              'firstName' => Obfuscation.obfuscate_all,
              'houseNumber' => Obfuscation.obfuscate_all,
              'mobilePhoneNumber' => Obfuscation.obfuscate_all,
              'passengerName' => Obfuscation.obfuscate_all,
              'phoneNumber' => Obfuscation.obfuscate_all,
              'street' => Obfuscation.obfuscate_all,
              'workPhoneNumber' => Obfuscation.obfuscate_all,
              'zip' => Obfuscation.obfuscate_all,
              'cardNumber' => Obfuscation.obfuscate_all_but_last(4),
              'expiryDate' => Obfuscation.obfuscate_all_but_last(2),
              'cvv' => Obfuscation.obfuscate_all,
              'iban' => Obfuscation.obfuscate_all_but_last(4),
              'accountNumber' => Obfuscation.obfuscate_all_but_last(4),
              'reformattedAccountNumber' => Obfuscation.obfuscate_all_but_last(4),
              'bin' => Obfuscation.obfuscate_all_but_first(6),
              'value' => Obfuscation.obfuscate_all,
              'keyId' => Obfuscation.obfuscate_with_fixed_length(8),
              'secretKey' => Obfuscation.obfuscate_with_fixed_length(8),
              'publicKey' => Obfuscation.obfuscate_with_fixed_length(8),
              'userAuthenticationToken' => Obfuscation.obfuscate_with_fixed_length(8),
              'encryptedPayload' => Obfuscation.obfuscate_with_fixed_length(8),
              'decryptedPayload' => Obfuscation.obfuscate_with_fixed_length(8),
              'encryptedCustomerInput' => Obfuscation.obfuscate_with_fixed_length(8)
            }
            additional_rules&.each do |name, rule|
              @obfuscation_rules[name] = rule
            end

            @property_pattern = build_property_pattern(@obfuscation_rules.keys)
          end

          private

          def build_property_pattern(property_names)
            return Regexp.union if property_names.empty? # no possible match

            # Regex to create:
            # (["'])(X|Y|Z)\1\s*:\s*(?:(["'])((?:\\.|(?!\3)[^\\])*)\3|([^"'\s\[\{]\S*))
            # Groups:
            # 1: opening " or ' for the property name
            # 2: property name
            # 3: opening " or ' for the value
            # 4: quoted value
            # 5: non-quoted-value
            # The quoted value is a sequence of escape pairs (a backslash and any
            # character) and of characters that are neither the closing quote nor
            # a backslash. Matching escape pairs as a whole, instead of checking
            # the character before the quote, allows escaped quotes as well as
            # values that end with an escaped backslash (\\ in JSON).
            regex = property_names.inject("([\"'])(") { |r, p| "#{r}#{Regexp.quote(p)}|" }.chop <<
                    ")\\1\\s*:\\s*(?:([\"'])((?:\\\\.|(?!\\3)[^\\\\])*)\\3|([^\"'\\s\\[\\{]((?!,)\\S)*))"
            /#{regex}/m # dotall mode
          end

          def obfuscate_value(property_name, value)
            obfuscation_rule = @obfuscation_rules[property_name]
            return obfuscation_rule.call(value) if obfuscation_rule

            value
          end

          public

          # Obfuscates the given body as necessary.
          #
          # @return (String)
          def obfuscate_body(body)
            return nil if body.nil?
            return '' if body.empty?

            body.gsub(@property_pattern) do
              m = Regexp.last_match
              group = m[4] ? 4 : 5
              value_start = m.begin(group) - m.begin(0)
              value_end = m.end(group) - m.begin(0)
              match = m[0]
              "#{match[0...value_start]}#{obfuscate_value(m[2], m[group])}#{match[value_end..]}"
            end
          end

          DEFAULT_OBFUSCATOR = BodyObfuscator.new
          private_constant :DEFAULT_OBFUSCATOR

          # @return [BodyObfuscator]
          def self.default_obfuscator
            DEFAULT_OBFUSCATOR
          end
        end
      end
    end
  end
end
