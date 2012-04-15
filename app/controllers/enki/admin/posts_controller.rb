module Enki
  module Admin
    class PostsController < BaseController
      before_filter :find_post, :only => [:show, :update, :destroy]

      def index
        respond_to do |format|
          format.html {
            @posts = Post.order("published_at DESC").paginated(params)
          }
        end
      end

      def create
        @post = build_post(post_params)
        if @post.save
          respond_to do |format|
            format.html {
              flash[:notice] = "Created post '#{@post.title}'"
              redirect_to(enki.admin_post_path(@post))
            }
          end
        else
          respond_to do |format|
            format.html { render :action => 'new', :status => :unprocessable_entity }
          end
        end
      end

      def update
        if @post.update_attributes(post_params)
          respond_to do |format|
            format.html {
              flash[:notice] = "Updated post '#{@post.title}'"
              redirect_to(enki.admin_post_path(@post))
            }
          end
        else
          respond_to do |format|
            format.html { render :action => 'show', :status => :unprocessable_entity }
          end
        end
      end

      def show
        respond_to do |format|
          format.html {
            render :partial => @post if request.xhr?
          }
        end
      end

      def new
        @post = build_post
      end

      def preview
        @post = Post.build_for_preview(post_params)

        respond_to do |format|
          format.js {
            render :partial => @post
          }
        end
      end

      def destroy
        undo_item = @post.destroy_with_undo

        respond_to do |format|
          format.html do
            flash[:notice] = "Deleted post '#{@post.title}'"
            redirect_to admin_posts_path
          end
          format.json {
            render :json => {
              :undo_path    => undo_admin_undo_item_path(undo_item),
              :undo_message => undo_item.description,
              :post         => @post.attributes
            }
          }
        end
      end

      protected

      def post_params
        post_attributes.merge(params[:enki_post])
      end

      def post_attributes
        super rescue {}
      end

      def build_post(attributes = {})
        Post.new(attributes.merge(post_attributes))
      end

      def find_post
        @post = Post.find(params[:id])
      end
    end
  end
end