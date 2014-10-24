# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alchemy-angular/version'

Gem::Specification.new do |spec|
  spec.name          = "alchemy-angular"
  spec.version       = AlchemyAngular::VERSION
  spec.authors       = ["Thomas von Deyen"]
  spec.email         = ["tvd@magiclabs.de"]
  spec.summary       = %q{AngularJS integration for AlchemyCMS}
  spec.description   = %q{Provides Rails generators and Angular controllers and directives for seamless integration of AlchemyCMS within your AngularJS powered one page frontend app.}
  spec.homepage      = ""
  spec.license       = "BSD"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "angular-rails-templates"
  spec.add_runtime_dependency "alchemy_cms", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
