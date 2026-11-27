# frozen_string_literal: true

module OnlinePayments
  module SDK
    module Logging
      module Obfuscation
        # Returns an obfuscation rule (callable) that will replace all characters with *
        def self.obfuscate_all
          lambda do |value|
            return value if value.nil? || value.empty?

            '*' * (value || '').length
          end
        end

        # Returns an obfuscation rule (function) that will replace values with a fixed length string containing only *
        def self.obfuscate_with_fixed_length(fixed_length)
          ->(_value) { '*' * fixed_length }
        end

        # Returns an obfuscation rule (function) that will keep a fixed number of characters at the start,
        # then replaces all other characters with *
        def self.obfuscate_all_but_first(count)
          lambda do |value|
            return value if value.nil? || value.empty?
            return value if value.length < count

            value[0, count] + ('*' * (value.length - count))
          end
        end

        # Returns an obfuscation rule that will keep a fixed number of characters at the end,
        # then replaces all other characters with *
        def self.obfuscate_all_but_last(count)
          lambda do |value|
            return value if value.nil? || value.empty?
            return value if value.length < count

            ('*' * (value.length - count)) + value[value.length - count, count]
          end
        end
      end
    end
  end
end
