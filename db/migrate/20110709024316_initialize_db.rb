class InitializeDb < ActiveRecord::Migration

  def change

    create_table "pages" do |t|
      t.string   "title",      :null => false
      t.string   "slug",       :null => false
      t.text     "body",       :null => false
      t.text     "body_html",  :null => false
      
      t.timestamps
    end

    add_index "pages", 'slug'
    add_index "pages", "title"
    add_index "pages", "created_at"

    create_table "posts" do |t|
      t.string   "title",           :null => false
      t.string   "slug",            :null => false
      t.text     "body",            :null => false
      t.text     "body_html",       :null => false
      t.boolean  "active",          :default => true,   :null => false
      t.string   "cached_tag_list"
      t.datetime "published_at"
      t.datetime "edited_at",       :null => false

      t.timestamps
    end

    add_index "posts", 'slug'
    add_index "posts", "published_at"

    create_table "undo_items" do |t|
      t.string   "type",       :null => false
      t.datetime "created_at", :null => false
      t.text     "data"
    end

    add_index "undo_items", "created_at"

    if comments?

      create_table "comments" do |t|
        t.integer  "post_id",                 :null => false
        t.string   "author",                  :null => false
        t.string   "author_url",              :null => false
        t.string   "author_email",            :null => false
        t.string   "author_openid_authority", :null => false
        t.text     "body",                    :null => false
        t.text     "body_html",               :null => false

        t.timestamps
      end

      add_index "comments", "post_id"
      add_index "comments", "created_at"

      add_column "posts", "approved_comments_count", :integer, :default => 0, :null => false

    end 

  end

  private
  
  def comments?
    Enki::Config.default[:features, :comments]
  end

end
