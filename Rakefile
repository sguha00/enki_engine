#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Enki::Application.load_tasks

require 'jeweler'
Jeweler::RubygemsDotOrgTasks.new

Jeweler::Tasks.new do |gem|
  gem.name = "enki-engine"
  gem.summary = %Q{Enki blog engine}
  gem.description = %Q{An adaptation of the Enki blogging application as a Rails::Engine, for mounting in a host application}
  gem.email = "andy.triggs@gmail.com"
  gem.homepage = "http://github.com/andyt"
  gem.authors = ["Andy Triggs"]
end
