module Enki
  module TagHelper
    def linked_tag_list(tags, options = {})
      raw tags.collect {|tag| link_to(tag.name, enki.posts_path(:tag => tag.name), options)}.join(", ")
    end
  end
end