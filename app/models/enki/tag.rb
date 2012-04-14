module Enki
  class Tag < ActsAsTaggableOn::Tag
    
    has_many :taggings, :dependent => :destroy
    
    # TODO: Contribute this back to acts_as_taggable_on
    # Update taggables' cached_tag_list
    after_destroy do |tag|
      tag.taggings.each do |tagging|
        taggable = tagging.taggable
        if taggable.class.caching_tag_list?
          taggable.tag_list = TagList.new(*taggable.tags.map(&:name))
          taggable.save
        end
      end
    end

  end
end