module Enki
  module Admin
    class DashboardController < BaseController
      def show
        @posts            = Post.find_recent(:limit => 8)
        @stats            = Stats.new
      end
    end
  end
end