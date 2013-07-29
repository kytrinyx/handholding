# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handholding/version'

Gem::Specification.new do |spec|
  spec.name          = "handholding"
  spec.version       = Handholding::VERSION
  spec.authors       = ["Katrina Owen"]
  spec.email         = ["katrina.owen@gmail.com"]
  spec.description   = %q{Explain errors and failures in a Minitest suite, and help people understand how to fix them. The goal is to help people learn how to read error messages, and to introduce TDD from day 1 without throwing people in the deep end.}
  spec.summary       = %q{Minitest plugin that explains errors and failures.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
