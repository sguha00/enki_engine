module Enki
  class PagesController < Enki::ApplicationController
    def show
      @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
    end
  end
end