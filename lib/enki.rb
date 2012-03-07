require 'enki/version'
require 'enki/engine' if defined?(Rails)

module Enki
  def self.config
    @@config ||= Config.default
  end
end