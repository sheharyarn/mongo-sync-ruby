# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_sync/version'

Gem::Specification.new do |spec|
  spec.name          = 'mongo_sync'
  spec.version       = MongoSync::VERSION
  spec.author        = 'Sheharyar Naseer'
  spec.email         = 'hello@sheharyar.me'
  spec.homepage      = 'https://sheharyar.me/'
  spec.license       = 'MIT'
  spec.summary       = 'A Ruby Gem for syncing local and remote Mongo Databases'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
