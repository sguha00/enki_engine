module Enki
  module TagHelper
    def linked_tag_list(tags)
      raw tags.collect {|tag| link_to(tag.name, enki.posts_path(:tag => tag.name))}.join(", ")
    end
  end
end