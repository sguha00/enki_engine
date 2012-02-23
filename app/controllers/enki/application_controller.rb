module Enki
  class ApplicationController < BaseController

    protect_from_forgery

    include ApplicationHelper
    include DateHelper
    include FormHelper
    include NavigationHelper
    include PageTitleHelper
    include PostsHelper
    include TagHelper
    include UrlHelper

    protected

    def enki_config
      @@enki_config = Enki::Config.default
    end
    helper_method :enki_config

    def comments?
      enki_config[:features, :comments]
    end
    helper_method :comments?

    def tags?
      enki_config[:features, :tags]
    end
    helper_method :tags?
    
  end
end