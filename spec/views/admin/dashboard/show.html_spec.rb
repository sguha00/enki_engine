require 'spec_helper'

module Enki

  describe "/admin/dashboard/show.html" do
    before(:each) do
      view.stub!(:enki_config).and_return(Enki::Config.default)
    end

    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      assign :posts, [mock_model(Post,
        :title             => 'A Post',
        :published_at      => Time.now,
        :slug              => 'a-post',
        :approved_comments => []
      )]
      assign :pages, [create(:page)]
      assign :comment_activity, [mock("comment-activity-1",
        :post                => mock_model(Post,
          :published_at      => Time.now,
          :title             => "A Post",
          :slug              => 'a-post',
          :approved_comments => []
        ),
        :comments            => [mock_model(Comment, :author => 'Don', :body_html => 'Hello')],
        :most_recent_comment => mock_model(Comment, :created_at => Time.now, :author => 'Don')
      )]
      assign :stats, Struct.new(:post_count, :page_count, :comment_count, :tag_count).new(3,4,2,1)
      render :template => '/enki/admin/dashboard/show', :formats => [:html]
    end
  end

end