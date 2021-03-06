# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jet_fuel/version'

Gem::Specification.new do |gem|
  gem.name          = "jet_fuel"
  gem.version       = JetFuel::VERSION
  gem.authors       = ["John Maddux"]
  gem.email         = ["jemaddux@gmail.com"]
  gem.description   = %q{Shortens links}
  gem.summary       = %q{Shortens links on the web.}
  gem.homepage      = "http://jetfuel.herokuapp.com"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
