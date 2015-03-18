# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redcarpet/render/hiki/version'

Gem::Specification.new do |spec|
  spec.name          = "redcarpet-render-hiki"
  spec.version       = Redcarpet::Render::Hiki::VERSION
  spec.authors       = ["Seiei Higa"]
  spec.email         = ["hanachin@gmail.com"]
  spec.summary       = %q{Hiki renderer for the redcarpet.}
  spec.description   = %q{Hiki renderer plugin for the redcarpet. You can convert Markdown to Hiki easier.}
  spec.homepage      = "https://github.com/hanachin/redcarpet-render-hiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redcarpet"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end
