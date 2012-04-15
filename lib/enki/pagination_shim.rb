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

  end
end