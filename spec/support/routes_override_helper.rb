module RoutesOverrideHelper

  extend ActiveSupport::Concern
  
  included do
    before do
      @routes = Enki::Engine.routes
    end
  end
  
end
    
