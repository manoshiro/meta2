# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meta2/version'

Gem::Specification.new do |spec|
  spec.name          = "meta2"
  spec.version       = Meta2::VERSION
  spec.authors       = ["manabu.oshiro"]
  spec.email         = ["manabu.oshiro@zinbun.com"]
  spec.summary       = %q{Implementation of the order to easily manage the meta-information.}
  spec.description   = %q{Implementation of the order to easily manage the meta-information for engineers and service managers. When your write i18n file or manage database through active record, put on it is reflected meta information on html.}
  spec.homepage      = "https://github.com/manoshiro/meta2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n", "~> 0.7.0"
  spec.add_dependency "activesupport", '>= 4.0.0', '< 5'


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
