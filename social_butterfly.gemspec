# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "social_butterfly/version"

Gem::Specification.new do |s|
  s.name        = "social_butterfly"
  s.version     = SocialButterfly::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Elliott"]
  s.email       = ["kevin@welikeinc.com"]
  s.homepage    = ""
  s.summary     = %q{Now your content can be as popular as Cher in Clueless}
  s.description = %q{Share and track content on social networks in Ruby.}

  s.rubyforge_project = "social_butterfly"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ['README.rdoc']
  s.require_paths = ["lib"]

  %w{ activesupport actionpack railties }.each do |gem|
    s.add_dependency gem, ['>= 3.0.0']
  end
  %w{ activerecord activemodel }.each do |gem|
    s.add_development_dependency gem, ['>= 3.0.0']
  end
end
