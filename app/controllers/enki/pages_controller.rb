module Enki
  class PagesController < BaseController
    def show
      @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
    end
  end
end