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

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<RedCloth>, ["~> 4.2.9"])
      s.add_runtime_dependency(%q<aaronh-chronic>, [">= 0"])
      s.add_runtime_dependency(%q<coderay>, [">= 0"])
      s.add_runtime_dependency(%q<lesstile>, [">= 0"])
      s.add_runtime_dependency(%q<formtastic>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
    else
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<RedCloth>, ["~> 4.2.9"])
      s.add_dependency(%q<aaronh-chronic>, [">= 0"])
      s.add_dependency(%q<coderay>, [">= 0"])
      s.add_dependency(%q<lesstile>, [">= 0"])
      s.add_dependency(%q<formtastic>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<RedCloth>, ["~> 4.2.9"])
    s.add_dependency(%q<aaronh-chronic>, [">= 0"])
    s.add_dependency(%q<coderay>, [">= 0"])
    s.add_dependency(%q<lesstile>, [">= 0"])
    s.add_dependency(%q<formtastic>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
  end
end

