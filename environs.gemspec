# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'environs/version'

Gem::Specification.new do |spec|
  spec.name          = 'environs'
  spec.version       = Environs::VERSION
  spec.authors       = ['Colin Rymer']
  spec.email         = ['colin.rymer@gmail.com']
  spec.description   = %q{A simple wrapper around the ENV hash that by default raises an error when value requested is not set.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/primedia/environs"
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
