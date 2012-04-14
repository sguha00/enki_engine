module Enki
  class PostsController < Enki::BaseController
    def index
      @tag = params[:tag]
      @posts = Post.find_recent(:tag => @tag, :include => :tags)

      respond_to do |format|
        format.html
        format.atom { render :layout => false }
      end
    end

    def show
      @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => includes_for_show}))
      @comment = Comment.new if comments?
    end

    protected

      def includes_for_show
        [
          comments? ? :approved_comments : nil,
          tags? ? :tags : nil
        ].compact
      end
  end
end