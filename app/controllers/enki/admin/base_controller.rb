module Enki
  module Admin
    class BaseController < Enki::ApplicationController
      
      before_filter :require_login

      protected

      def set_content_type
        headers['Content-Type'] ||= 'text/html; charset=utf-8'
      end

    end
  end
end