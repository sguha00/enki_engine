module Enki
  module Admin
    class HealthController < BaseController
      verify :method => 'post',
             :only   => 'generate_exception',
             :add_headers => {
               "Allow" => "POST"},
             :render => {
               :text   => 'Method not allowed',
               :status => 405}

      def index
      end

      def generate_exception
        raise RuntimeError
      end
    end
  end
end