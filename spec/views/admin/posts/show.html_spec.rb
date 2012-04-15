require 'spec_helper'

module Enki

  describe "/admin/posts/show.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      assign :post, create(:post)
      render :template => '/enki/admin/posts/show', :formats => [:html]
    end
  end

end