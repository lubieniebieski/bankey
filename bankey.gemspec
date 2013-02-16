# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bankey/version'

Gem::Specification.new do |gem|
  gem.name          = "bankey"
  gem.version       = Bankey::VERSION
  gem.authors       = ["Adam Nowak"]
  gem.email         = ["lubieniebieski@gmail.com"]
  gem.description   = %q{get given characters from your password }
  gem.summary       = %q{I was bored by figuring out 3rd, 4th, 8th and xth character from my password when I was attempting to login to my bank account. so here we are...}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
