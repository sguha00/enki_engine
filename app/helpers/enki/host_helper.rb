module Enki
  module HostHelper

    # A simplistic way of skipping the host app view paths and rendering a file directly from a Rails::Engine. 
    # An engine can technically have multiple app/views paths. This method uses only the first defined one.
    # 
    # TODO: Add support for rendering methods other than :file.
    def render_enki(options)
      if options[:file]
        render options.merge(:file => File.join(Enki::Engine.paths['app/views'].first.to_s, options[:file]))
      elsif options[:page]
        render_enki(:file => 'enki/pages/show', :locals => { :page => options[:page] })
      else
        raise ArgumentError, 'Unsupported render method.'
      end
    end
  
  end
end