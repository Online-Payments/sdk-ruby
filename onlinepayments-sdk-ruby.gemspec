require_relative 'lib/onlinepayments/sdk/version'

Gem::Specification.new do |spec|
  spec.name           = 'onlinepayments-sdk-ruby'
  spec.version        = OnlinePayments::SDK::VERSION
  spec.authors        = ['Online Payments support team']
  spec.email          = ['96182451+online-payments-support-team@users.noreply.github.com']
  spec.summary        = %q{SDK to communicate with the Online Payments platform using the Online Payments Server API}
  spec.description    = %q{SDK to communicate with the Online Payments platform using the Online Payments Server API}
  spec.homepage       = %q{https://github.com/Online-Payments/sdk-ruby}
  spec.license        = 'MIT'

  # exclude hidden files like .gitignore
  spec.files          = Dir['lib/**/*'] + Dir['skills/**/*'] + Dir['spec/**/*'] +
                        ['onlinepayments-sdk-ruby.gemspec', 'Gemfile', 'LICENSE.txt', 'Rakefile', 'README.md', 'AGENTS.md']
  spec.executables    = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.require_paths  = ['lib']

  spec.required_ruby_version = '>= 3.4'

  spec.add_dependency 'net-http-persistent', '~> 4.0'
  spec.add_dependency 'concurrent-ruby', '~> 1.3'
  spec.add_dependency 'base64', '~> 0.2'

  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.6'
  spec.add_development_dependency 'simplecov', '~> 0.22'
  spec.add_development_dependency 'webmock', '~> 3.0'
  spec.add_development_dependency 'puma', '~> 8.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.92.0'
  spec.add_development_dependency 'logger', '~> 1.6'
  spec.add_development_dependency 'dotenv', '~> 3.1'
  # spec.metadata['yard.run'] = 'yri'  # compiles yard doc on install
end
