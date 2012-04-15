module Enki
  module PaginationShim
    
    def paginated(params)
      if defined? ::Kaminari
        page params[:page]
      elsif defined? ::WillPagniate
        paginate :page => params[:page]
      else
        all
      end
    end

    def paginated_pages
      if defined? ::Kaminari
        num_pages
      elsif defined? ::WillPagniate
        total_pages
      else
        1
      end
    end

  end
end