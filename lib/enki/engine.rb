# Bundler 1.0.10 incorrectly activates the new experimental Psych YAML parser
# in 1.9.2, which breaks on RedCloth. This hack reverts it, but can be removed
# once it is all sorted out. The const_defined check is required for 1.8.7 compat.
YAML::ENGINE.yamler = "syck" if YAML.const_defined?("ENGINE")

require 'enki'
require 'rails'
require 'rubygems'
require 'redcloth'
require 'chronic'
require 'coderay'
require 'lesstile'

module Enki
  class Engine < Rails::Engine
    engine_name 'enki'
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
