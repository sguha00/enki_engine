require 'spec_helper'

module Enki

  describe "/admin/posts/new.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      assign :post, Post.new
      render :template => '/enki/admin/posts/new', :formats => [:html]
    end
  end

end