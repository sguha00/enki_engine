module Enki
  module ApplicationHelper
    def author
      Struct.new(:name, :email).new(enki_config[:author][:name], enki_config[:author][:email])
    end

    def open_id_delegation_link_tags(server, delegate)
      raw links = <<-EOS
        <link rel="openid.server" href="#{server}">
        <link rel="openid.delegate" href="#{delegate}">
      EOS
    end

    def format_comment_error(error)
      {
        'body'   => 'Please comment',
        'author' => 'Please provide your name or OpenID identity URL',
        'base'   => error.last
      }[error.first.to_s]
    end

    # A simplistic way of skipping the host app view paths and rendering a file directly from a Rails::Engine. 
    # An engine can technically have multiple app/views paths. This method uses only the first defined one.
    # 
    # TODO: Add support for rendering methods other than :file.
    def render_enki(options)
      raise ArgumentError, 'This method only supports file rendering currently.' unless options[:file]
      render options.merge(:file => File.join(Enki::Engine.paths['app/views'].first.to_s, options[:file]))
    end
  
  end
end