module Enki
  class CommentsController < BaseController
    
    before_filter :find_post, :except => [:new]

    def index
      redirect_to(post_path(@post))
    end

    def new
      @comment = Comment.build_for_preview(params[:comment])

      respond_to do |format|
        format.js do
          render :partial => 'comment', :locals => {:comment => @comment}
        end
      end
    end

    def create
      @comment = Comment.new((session[:pending_comment] || params[:comment] || {}).
        reject {|key, value| !Comment.protected_attribute?(key) })
      @comment.post = @post

      session[:pending_comment] = nil

      if @comment.save
        redirect_to post_path(@post)
      else
        render :template => 'posts/show'
      end
    end

    protected

    def find_post
      @post = Post.find_by_permalink(*[:year, :month, :day, :slug].map {|x|
        params[x]
      })
    end

  end
end