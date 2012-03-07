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

  end
end