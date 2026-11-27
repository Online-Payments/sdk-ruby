# frozen_string_literal: true

Dir[File.join(__dir__, 'authentication', '*.rb')].each { |f| require f }
