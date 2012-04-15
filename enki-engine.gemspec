# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "enki/version"

Gem::Specification.new do |s|
  s.name        = "enki-engine"
  s.version     = Enki::VERSION
  s.date        = "2012-02-22"
  s.authors     = ["Andy Triggs"]
  s.email       = ["andy.triggs@gmail.com"]
  s.homepage    = "http://github.com/andyt"
  s.summary     = %Q{Enki blog engine}
  s.description = %Q{An adaptation of the Enki blogging application as a Rails::Engine, for mounting in a host application}

  s.rubyforge_project = "enki-engine"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = [
    "LICENSE",
    "README.textile"
  ]
  s.require_paths = ["lib"]

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2.0") if s.respond_to? :required_rubygems_version=

  s.add_runtime_dependency 'RedCloth',        "~> 4.2.9"
  s.add_runtime_dependency 'aaronh-chronic'
  s.add_runtime_dependency 'coderay'
  s.add_runtime_dependency 'lesstile'
  s.add_runtime_dependency 'simple_form'
  
  s.add_development_dependency 'acts-as-taggable-on'
  s.add_development_dependency 'rails',           "~> 3.2"
  s.add_development_dependency 'rspec-rails',     ">= 2.9"
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'nokogiri',        '~> 1.5.0'
  s.add_development_dependency 'webrat'
  s.add_development_dependency 'sqlite3'

  # s.add_development_dependency 'cucumber-rails',    :require => false
  # s.add_development_dependency 'cucumber-websteps', :require => false
end


