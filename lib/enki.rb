require 'enki/config'
require 'enki/version'
require 'enki/engine' if defined?(Rails)
require 'acts-as-taggable-on'
require 'simple_form'

module Enki

  class NotLoggedInError < StandardError; end

  def self.config
    @@config ||= Enki::Config.default
  end
end