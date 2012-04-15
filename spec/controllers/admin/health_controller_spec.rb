require File.dirname(__FILE__) + '/../../spec_helper'

module Enki

  describe Admin::HealthController do
    describe 'handling GET to index' do
      before(:each) do
        controller.stub!(:logged_in?).and_return(true)
        get :index
      end

      it "is successful" do
        response.should be_success
      end

      it "renders health template" do
        response.should render_template("index")
      end
    end

    describe 'handling POST to generate_exception' do
      describe 'when logged in' do
        it 'raises a RuntimeError' do
          controller.stub!(:logged_in?).and_return(true)
          lambda {
            post :generate_exception
          }.should raise_error
        end
      end

      describe 'when not logged in' do
        it 'does not raise' do
          lambda {
            post :generate_exception
          }.should raise_error(Enki::NotLoggedInError)
        end
      end
    end

    describe 'handling GET to generate_exception' do
      it '405s' do
        controller.stub!(:logged_in?).and_return(true)
        get :generate_exception
        response.status.should == 405
        response.headers['Allow'].should == 'POST'
      end
    end
  end
end