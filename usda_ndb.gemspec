# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usda_ndb/version'

Gem::Specification.new do |spec|
  spec.name          = 'usda_ndb'
  spec.version       = UsdaNdb::VERSION
  spec.authors       = ['aTeapot']
  spec.email         = ['latem999@o2.pl']

  spec.summary       = 'Wrapper for USDA National Nutrient Database API'
  spec.homepage      = 'http://github.com/aTeapot/usda_ndb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '> 1.7', '< 3'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0'
end
