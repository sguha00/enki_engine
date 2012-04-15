require 'spec_helper'

module Enki

  describe Admin::DashboardController do
    
    before do
      controller.stub!(:logged_in?).and_return(true)
    end
    
    describe 'handling GET to show' do
      before(:each) do
        @pages    = [create(:page), create(:page)]
        @posts    = [create(:post), create(:post)]
        @comment_activity = @posts.map { |post| create(:comment, :post => post); CommentActivity.new(post) }
        Page.stub!(:find_recent).and_return(@pages)
        Post.stub!(:find_recent).and_return(@posts)
        Stats.stub!(:new).and_return(@stats = Struct.new(:post_count, :page_count, :comment_count, :tag_count).new(3,4,2,1))

        CommentActivity.stub!(:find_recent).and_return(@comment_activity)

        get :show
      end

      it "is successful" do
        response.should be_success
      end

      it "renders show template" do
        response.should render_template('show')
      end

      it "finds posts for the view" do
        assigns[:posts].should == @posts
      end

      it "assigns stats for the view" do
        assigns[:stats].should == @stats
      end

      it "finds comment activity for the view" do
        assigns[:comment_activity].should == @comment_activity
      end
    end
  end

end