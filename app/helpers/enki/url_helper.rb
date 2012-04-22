module Enki
  module UrlHelper
    def post_path(post, options = {})
      suffix = options[:anchor] ? "##{options[:anchor]}" : ""
      path = [Enki.config[:engine, :mount_at], post.published_at.strftime("/%Y/%m/%d/") + post.slug + suffix].join
      if options[:only_path] == false
        URI.join(Enki.config[:url], path) 
      else
        path
      end
    end

    def post_comments_path(post, comment)
      post_path(post) + "/comments"
    end

    def author_link(comment)
      if comment.author_url.blank?
       comment.author
      else
        link_to(comment.author, comment.author_url, :class => 'openid')
      end
    end
  end
end