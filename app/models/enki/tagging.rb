module Enki
  class Tagging < ActsAsTaggableOn::Tagging
    
    belongs_to :tag, :counter_cache => true
        
  end
end