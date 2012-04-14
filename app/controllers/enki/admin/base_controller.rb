module Enki
  module Admin
    class BaseController < Enki::ApplicationController

      protected

      def set_content_type
        headers['Content-Type'] ||= 'text/html; charset=utf-8'
      end

    end
  end
end