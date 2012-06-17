# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dapper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jefferson Carley"]
  gem.email         = ["jeff.carley@gmail.com"]
  gem.description   = %q{A gem for using presenters in your rails application.}
  gem.summary       = %q{Dapper makes it really easy to include presenters into your application.  Very handy for cleaning up your views.}
  gem.homepage      = "https://github.com/jcarley/Dapper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dapper"
  gem.require_paths = ["lib"]
  gem.version       = Dapper::VERSION
end
