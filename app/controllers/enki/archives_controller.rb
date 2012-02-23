module Enki
  class ArchivesController < Enki::ApplicationController
    def index
      @months = Post.find_all_grouped_by_month
    end
  end
end