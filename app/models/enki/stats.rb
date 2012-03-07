module Enki
  class Stats
    def post_count
      Post.count
    end

    def page_count
      Page.count
    end

    def comment_count
      Comment.count
    end

    def tag_count
      Tag.count
    end
  end
end