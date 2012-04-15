module Enki
  class UndoItem < ActiveRecord::Base
    
    attr_accessible :data, :type
    
    def process!
      raise("#process must be implemented by subclasses")
    end
  end
end