module Enki
  class ArchivesController < BaseController
    def index
      @months = Post.find_all_grouped_by_month
    end
  end
end