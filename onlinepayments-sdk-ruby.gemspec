Gem::Specification.new do |spec|
  spec.name           = 'onlinepayments-sdk-ruby'
  spec.version        = '6.1.0'
  spec.authors        = ['Online Payments support team']
  spec.email          = ['96182451+online-payments-support-team@users.noreply.github.com']
  spec.summary        = %q{SDK to communicate with the Online Payments platform using the Online Payments Server API}
  spec.description    = %q{SDK to communicate with the Online Payments platform using the Online Payments Server API}
  spec.homepage       = %q{https://github.com/Online-Payments/sdk-ruby}
  spec.license        = 'MIT'

  # exclude hidden files like .gitignore
  spec.files          = Dir['lib/**/*'] + Dir['spec/**/*'] +
                        ['onlinepayments-sdk-ruby.gemspec', 'Gemfile', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.executables    = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files     = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths  = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency 'httpclient', '~> 2.8'
  spec.add_dependency 'concurrent-ruby', '~>1.0'

  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'sinatra', '~> 2.1'
  spec.add_development_dependency 'webrick', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  # spec.metadata['yard.run'] = 'yri'  # compiles yard doc on install
end
