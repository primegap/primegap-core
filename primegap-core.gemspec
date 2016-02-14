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

  spec.files = Dir['{app,db,lib}/**/*', 'Rakefile', 'README.md']
  spec.test_files = Dir['spec/**/*']

  # Rails dependencies
  spec.add_dependency 'railties', '5.0.0.beta1.1'
  spec.add_dependency 'activerecord', '5.0.0.beta1.1'
  spec.add_dependency 'actionmailer', '5.0.0.beta1.1'

  # Other dependecies
  spec.add_dependency 'bcrypt', '~> 3.1.7'

  # Development/Test dependencies
  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.5'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'shoulda-matchers', '~> 3.0'
end
