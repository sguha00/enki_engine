module Enki
  class Admin::BaseController < ApplicationController
    layout 'admin'

    before_filter :require_login

    protected

    def require_login
      return redirect_to(enki.admin_session_path) unless session[:logged_in]
    end

    def set_content_type
      headers['Content-Type'] ||= 'text/html; charset=utf-8'
    end
  end
end