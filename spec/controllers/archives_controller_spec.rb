require 'spec_helper'

module Enki
  describe ArchivesController do
    describe 'handling GET to index' do
      before(:each) do
        month = Struct.new(:date, :posts)
        @months = [ month.new( 1.month.ago.utc.beginning_of_month, [create(:post)] ) ]
        Post.stub!(:find_all_grouped_by_month).and_return(@months)
      end

      it "should be successful" do
        get :index

        response.should be_success
      end

      it "should render index template" do
        get :index

        response.should render_template('index')
      end

      it "should assign the found months for the view" do
        get :index

        assigns[:months].should == @months
      end

      it 'should find posts grouped by month' do
        Post.should_receive(:find_all_grouped_by_month).and_return(@months)
        
        get :index
      end
    end
  end
end