module Enki
  class ApplicationController < ::ApplicationController

    include Enki::ApplicationHelper
    include Enki::DateHelper
    include Enki::FormHelper
    include Enki::NavigationHelper
    include Enki::PageTitleHelper
    include Enki::PostsHelper
    include Enki::TagHelper
    include Enki::UrlHelper
    include Enki::HostHelper

    protected

    def require_login
      raise NotLoggedInError unless respond_to?(:logged_in?) && logged_in?
    end

  end
end