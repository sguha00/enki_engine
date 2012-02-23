class InitializeDb < ActiveRecord::Migration

  def self.comments?
    Enki::Config.default[:features, :comments]
  end

  def self.up

    create_table "pages" do |t|
      t.string   "title",      :null => false
      t.string   "slug",       :null => false
      t.text     "body",       :null => false
      t.text     "body_html",  :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "pages", ["title"], :name => "index_pages_on_title"
    add_index "pages", ["created_at"], :name => "index_pages_on_created_at"

    create_table "posts" do |t|
      t.string   "title",                                                      :null => false
      t.string   "slug",                                                       :null => false
      t.text     "body",                                                       :null => false
      t.text     "body_html",                                                  :null => false
      t.boolean  "active",                  :default => true,                  :null => false
      t.string   "cached_tag_list"
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "edited_at",                                                  :null => false
    end

    add_index "posts", ["published_at"], :name => "index_posts_on_published_at"

    create_table "undo_items" do |t|
      t.string   "type",       :null => false
      t.datetime "created_at", :null => false
      t.text     "data"
    end

    add_index "undo_items", ["created_at"], :name => "index_undo_items_on_created_at"

    if comments?

      create_table "comments" do |t|
        t.integer  "post_id",                 :null => false
        t.string   "author",                  :null => false
        t.string   "author_url",              :null => false
        t.string   "author_email",            :null => false
        t.string   "author_openid_authority", :null => false
        t.text     "body",                    :null => false
        t.text     "body_html",               :null => false
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
      add_index "comments", ["created_at"], :name => "index_comments_on_created_at"

      add_column "posts", "approved_comments_count", :integer, :default => 0, :null => false

    end 

  end

  def self.down
    raise IrreversibleMigration
  end
end
