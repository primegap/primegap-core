# coding: utf-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'primegap/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'primegap-core'
  spec.version       = Primegap::Core::VERSION
  spec.authors       = ['Luca Tironi']
  spec.email         = ['luca.tironi@gmail.com']

  spec.summary       = 'PrimeGap Business Logic'
  spec.description   = 'PrimeGap Business Logic'
  spec.homepage      = 'http://primegap.net'

  spec.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']
  spec.test_files = Dir['spec/**/*']

  spec.add_dependency 'rails', '~> 4.2.4'

  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec-rails', '~> 3.3'
end
