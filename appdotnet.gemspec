# -*- encoding: utf-8 -*-
require File.expand_path('../lib/appdotnet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Brodhead"]
  gem.email         = ["mkb@orthogonal.org"]
  gem.description   = %q{The beginings of a client gem for App.net}
  gem.summary       = %q{Not even complete enough to be considered broken.  Beware.}
  gem.homepage      = "https://github.com/mkb/appdotnet-ruby"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.files.reject!   {|f| f =~ /^vendor/}

  gem.name          = "appdotnet"
  gem.require_paths = ["lib"]
  gem.version       = AppDotNet::VERSION

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('guard-rspec')
end
