# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tsung/version'

Gem::Specification.new do |spec|
  spec.name = 'tsung'
  spec.version = Tsung::VERSION
  spec.authors = ['Darthjee']
  spec.email = ['darthjee@gmail.com']
  spec.summary = 'Tsung'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'activemodel'
  spec.add_runtime_dependency 'activerecord'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rspec-mocks'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'

  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'factory_girl'
end