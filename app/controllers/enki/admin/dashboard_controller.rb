module Enki
  class Admin::DashboardController < Admin::BaseController
    def show
      @posts            = Post.find_recent(:limit => 8)
      @stats            = Stats.new
    end
  end
end