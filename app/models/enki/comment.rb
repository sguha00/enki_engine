module Enki
  class Comment < ActiveRecord::Base
    DEFAULT_LIMIT = 15

    belongs_to            :post
    
    attr_accessible       :author, :author_url, :author_email, :body, :post, :created_at, :body_html, :updated_at

    before_save           :apply_filter
    after_save            :denormalize
    after_destroy         :denormalize

    validates_presence_of :author, :body, :post

    def apply_filter
      self.body_html = Lesstile.format_as_xhtml(self.body, :code_formatter => Lesstile::CodeRayFormatter)
    end

    def trusted_user?
      false
    end

    def user_logged_in?
      false
    end

    def approved?
      true
    end

    def denormalize
      self.post.denormalize_comments_count!
    end

    def destroy_with_undo
      undo_item = nil
      transaction do
        self.destroy
        undo_item = DeleteCommentUndo.create_undo(self)
      end
      undo_item
    end

    # Delegates
    def post_title
      post.title
    end

    class << self
      def protected_attribute?(attribute)
        [:author, :body].include?(attribute.to_sym)
      end

      def new_with_filter(params)
        comment = Comment.new(params)
        comment.created_at = Time.now
        comment.apply_filter
        comment
      end

      def build_for_preview(params)
        Comment.new_with_filter(params)
      end

      def find_recent(options = {})
        find(:all, {
          :limit => DEFAULT_LIMIT,
          :order => 'created_at DESC'
        }.merge(options))
      end
    end
  end
end