module Enki
  module UrlHelper
    def post_path(post, options = {})
      suffix = options[:anchor] ? "##{options[:anchor]}" : ""
      path = post.published_at.strftime("/%Y/%m/%d/") + post.slug + suffix
      if options[:only_path] == false
        URI.join(Enki.config[:url], Enki.config[:engine, :mount_at], path) 
      else
        [Enki.config[:engine, :mount_at], path].join
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