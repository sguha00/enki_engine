module Enki
  module ApplicationHelper
    
    def author
      Struct.new(:name, :email).new(Enki.config[:author][:name], Enki.config[:author][:email])
    end

    def format_comment_error(error)
      {
        'body'   => 'Please comment',
        'author' => 'Please provide your name or OpenID identity URL',
        'base'   => error.last
      }[error.first.to_s]
    end

    def comments?
      Enki.config.comments?
    end
    
    def tags?
      Enki.config.tags?
    end
    
    def paginated(*args)
      if defined? ::Kaminari
        paginate(*args)
      elsif defined? ::WillPagniate
        will_paginate(*args)
      else
        nil
      end
    end

  end
end