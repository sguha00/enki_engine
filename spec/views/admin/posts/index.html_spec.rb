require 'spec_helper'

module Enki

  describe "/admin/posts/index.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      posts = [mock_model(Post,
        :published_at      => Time.now,
        :title             => 'A post',
        :body              => 'Hello I am a post',
        :slug              => 'a-post',
        :approved_comments => []
      )]
      posts.stub!(:total_pages).and_return(1)
      assign :posts, posts
      render :template => '/enki/admin/posts/index', :formats => [:html]
    end
  end

end