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
        t.string   "author"
        t.string   "author_url"
        t.string   "author_email"
        t.text     "body",                    :null => false
        t.text     "body_html",               :null => false

        t.timestamps
      end

      add_index "comments", "post_id"
      add_index "comments", "created_at"

      add_column "posts", "approved_comments_count", :integer, :default => 0, :null => false

    end 
    
    if tags?
      
      create_table 'tags' do |t|
        t.string  'name'
        t.integer "taggings_count", :default => 0, :null => false
      end

      create_table 'taggings' do |t|
        t.references 'tag'

        t.references 'taggable', :polymorphic => true
        t.references 'tagger', :polymorphic => true

        t.string 'context', :limit => 128

        t.timestamps
      end

      add_index 'taggings', 'tag_id'
      add_index 'taggings', ['taggable_id', 'taggable_type', 'context']
      
    end

  end

  private
  
  def comments?
    Enki::Config.default[:features, :comments]
  end
  
  def tags?
    Enki::Config.default[:features, :tags]
  end

end
