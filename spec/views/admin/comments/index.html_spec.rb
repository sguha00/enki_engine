require 'spec_helper'

module Enki
  
  describe "/admin/comments/index.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      comments = [mock_model(Comment,
        :author     => 'Don Alias',
        :body       => 'Hello I am a post',
        :created_at => Time.now,
        :post_title => 'A Post',
        :post => mock_model(Post,
          :slug         => 'a-post',
          :published_at => Time.now
        )
      )].extend PaginationShim
      assign :comments, comments
      render :template => '/enki/admin/comments/index', :formats => [:html]
    end
  end

end