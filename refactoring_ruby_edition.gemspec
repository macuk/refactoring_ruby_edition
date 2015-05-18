# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'refactoring_ruby_edition/version'

Gem::Specification.new do |spec|
  spec.name          = "refactoring_ruby_edition"
  spec.version       = RefactoringRubyEdition::VERSION
  spec.authors       = ["Piotr Macuk"]
  spec.email         = ["piotr@macuk.pl"]

  spec.summary       = 'Step by step refactoring with Refactoring book.'
  spec.description   = ''
  spec.homepage      = "https://github.com/macuk/refactoring_ruby_edition"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rubocop"
end
