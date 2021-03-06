module Enki
  module Base
    class Post < ActiveRecord::Base

      extend PaginationShim

      DEFAULT_LIMIT = 15

      acts_as_taggable

      has_many :taggings, :as => :taggable, :dependent => :destroy, :include => :tag
      has_many :base_tags, :through => :taggings, :source => :tag

      if Enki.config.comments?
        has_many                :comments, :dependent => :destroy
        has_many                :approved_comments, :class_name => 'Comment'
      end
      
      attr_accessible         :body, :edited_at, :minor_edit, :published_at, :published_at_natural, :slug, :tag_list, :title,
                              :body_html, :active, :cached_tag_list, :created_at, :updated_at, :approved_comments_count, :author

      before_validation       :generate_slug
      before_validation       :set_dates
      before_save             :apply_filter

      validates_presence_of   :title, :slug, :body

      validate                :validate_published_at_natural

      #------------------------------
      # Scopes
      #------------------------------
      def self.published_desc
        order('posts.published_at DESC')
      end

      def self.only_published
        where(['published_at < ?', Time.zone.now])
      end

      def self.find_recent(options = {})
        tag     = options.delete(:tag)
        limit   = options.delete(:limit) || DEFAULT_LIMIT

        query = tag ? tagged_with(tag) : self
        query = query.only_published.published_desc.limit(limit)

        return options.empty? ? query : all(options)
      end


      #------------------------------
      # Class Methods
      #------------------------------
      def self.default_limit
        DEFAULT_LIMIT
      end


      #------------------------------
      # Instance Methods
      #------------------------------
      def validate_published_at_natural
        errors.add("published_at_natural", "Unable to parse time") unless published?
      end

      attr_accessor :minor_edit
      def minor_edit
        @minor_edit ||= "1"
      end

      def minor_edit?
        self.minor_edit == "1"
      end

      def published?
        published_at?
      end

      attr_accessor :published_at_natural
      def published_at_natural
        @published_at_natural ||= published_at.send_with_default(:strftime, 'now', "%Y-%m-%d %H:%M")
      end
      
      class << self
        def build_for_preview(params)
          post = self.new(params)
          post.generate_slug
          post.set_dates
          post.apply_filter
          TagList.from(params[:tag_list]).each do |tag|
            post.tags << Tag.new(:name => tag)
          end
          post
        end

        def find_by_permalink(year, month, day, slug, options = {})
          begin
            day = Time.parse([year, month, day].collect(&:to_i).join("-")).midnight
            post = find_all_by_slug(slug, options).detect do |post|
              [:year, :month, :day].all? {|time|
                post.published_at.send(time) == day.send(time)
              }
            end
          rescue ArgumentError # Invalid time
            post = nil
          end
          post || raise(ActiveRecord::RecordNotFound)
        end

        def find_all_grouped_by_month
          posts = find(
            :all,
            :order      => 'posts.published_at DESC',
            :conditions => ['published_at < ?', Time.now]
          )
          month = Struct.new(:date, :posts)
          posts.group_by(&:month).inject([]) {|a, v| a << month.new(v[0], v[1])}
        end
      end

      def destroy_with_undo
        transaction do
          undo = DeletePostUndo.create_undo(self)
          self.destroy
          return undo
        end
      end

      def month
        published_at.beginning_of_month
      end

      def apply_filter
        self.body_html = EnkiFormatter.format_as_xhtml(self.body)
      end

      def set_dates
        self.edited_at = Time.now if self.edited_at.nil? || !minor_edit?
        if new_published_at = Chronic.parse(self.published_at_natural)
          self.published_at = new_published_at
        end
      end

      def denormalize_comments_count!
        Post.update_all(["approved_comments_count = ?", self.approved_comments.count], ["id = ?", self.id])
      end

      def generate_slug
        self.slug = self.title.dup if self.slug.blank?
        self.slug.slugorize!
      end
    end
  end
end
