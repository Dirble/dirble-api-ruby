# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dirble/version'

Gem::Specification.new do |spec|
  spec.name          = 'dirble'
  spec.version       = Dirble::VERSION
  spec.authors       = ['Przemek Mroczek']
  spec.email         = ['przemyslawmroczek@o2.pl']
  spec.summary       = %q{Gem for easier interacting with dirble api.}
  spec.description   = %q{Api wrapper for easier using dirble api.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry-rescue'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'sinatra-contrib'
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'typhoeus'
  spec.add_runtime_dependency 'iso_country_codes'
  spec.add_development_dependency 'coveralls'
end
