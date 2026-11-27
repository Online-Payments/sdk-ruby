# frozen_string_literal: true

module OnlinePayments
  module SDK
    module Logging
      module Obfuscation
        # Abstract mixin module that allows specifying body and header obfuscators for an object.
        #
        # Implementations override the writer methods (body_obfuscator=, header_obfuscator=). Implementations that still
        # override the deprecated set_* methods keep working: each name falls back to the other one.
        module ObfuscationCapable
          # Sets the current body obfuscator to use.
          def body_obfuscator=(body_obfuscator)
            raise NotImplementedError if method(:set_body_obfuscator).owner == ObfuscationCapable

            set_body_obfuscator(body_obfuscator)
          end

          # Sets the current header obfuscator to use.
          def header_obfuscator=(header_obfuscator)
            raise NotImplementedError if method(:set_header_obfuscator).owner == ObfuscationCapable

            set_header_obfuscator(header_obfuscator)
          end

          # @deprecated Use {#body_obfuscator=} instead.
          def set_body_obfuscator(body_obfuscator) # rubocop:disable Naming/AccessorMethodName
            raise NotImplementedError if method(:body_obfuscator=).owner == ObfuscationCapable

            self.body_obfuscator = body_obfuscator
          end

          # @deprecated Use {#header_obfuscator=} instead.
          def set_header_obfuscator(header_obfuscator) # rubocop:disable Naming/AccessorMethodName
            raise NotImplementedError if method(:header_obfuscator=).owner == ObfuscationCapable

            self.header_obfuscator = header_obfuscator
          end
        end
      end
    end
  end
end
