module Enki
  module Admin
    class DashboardController < BaseController
      def show
        @posts            = Post.find_recent(:limit => 8)
        @pages            = Page.limit(8)
        @comment_activity = CommentActivity.find_recent if comments?
        @stats            = Stats.new
      end
    end
  end
end