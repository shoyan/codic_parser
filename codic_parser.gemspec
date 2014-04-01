# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codic_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "codic_parser"
  spec.version       = CodicParser::VERSION
  spec.authors       = ["Shohei Yamasaki"]
  spec.email         = ["shyamasaki@gmail.com"]
  spec.summary       = %q{CodicParser is a command-line interface. Codic.jp via terminal.}
  spec.description   = %q{CodicParser is a command-line interface. Codic.jp via terminal.}
  spec.homepage      = "https://github.com/shoyan/codic_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency 'thor'
  spec.add_dependency 'nokogiri', '~> 1.5.10'
end
