module Enki
  module Admin
    class CommentsController < BaseController
      before_filter :find_comment, :only => [:show, :update, :destroy]

      def index
        @comments = Comment.order("comments.created_at DESC").includes(:post).paginated(params)
      end

      def show
        respond_to do |format|
          format.html {
            render :partial => 'comment', :locals => {:comment => @comment} if request.xhr?
          }
        end
      end

      def update
        if @comment.update_attributes(params[:comment])
          flash[:notice] = "Updated comment by #{@comment.author}"
          redirect_to [:admin, :comments]
        else
          render :action => 'show'
        end
      end

      def destroy
        undo_item = @comment.destroy_with_undo

        respond_to do |format|
          format.html do
            flash[:notice] = "Deleted comment by #{@comment.author}"
            redirect_to admin_comments_url
          end
          format.json {
            render :json => {
              :undo_path    => undo_admin_undo_item_path(undo_item),
              :undo_message => undo_item.description,
              :comment      => @comment.attributes
            }.to_json
          }
        end
      end

      protected

      def find_comment
        @comment = Comment.find(params[:id])
      end
    end
  end
end