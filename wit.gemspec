lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wit/version'

Gem::Specification.new do |spec|
	spec.name          = 'wit'
	spec.version       = Wit::VERSION
	spec.authors       = ['Justin Workman']
	spec.email         = ['xtagon@gmail.com']
	spec.summary       = 'A Ruby wrapper for the Wit HTTP API.'
	spec.description   = 'A Ruby wrapper for the Wit HTTP API, a natural language processing interface.'
	spec.license       = 'MIT'

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]

	spec.add_development_dependency 'bundler', '~> 1.3'
	spec.add_development_dependency 'rake'
	spec.add_development_dependency 'redcarpet'
	spec.add_development_dependency 'rspec', '~> 2.14.1'
	spec.add_development_dependency 'yard'
end
