require 'enki/config'
require 'enki/version'
require 'enki/engine' if defined?(Rails)

module Enki
  def self.config
    @@config ||= Enki::Config.default
  end
end