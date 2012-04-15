require File.dirname(__FILE__) + '/../../spec_helper'

module Enki

  describe "/pages/show.html" do
    include UrlHelper

    before(:each) do
      view.stub!(:enki_config).and_return(Enki::Config.default)

      assign :page, create(:page)
    end

    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it "should render a page" do
      render :template => "/enki/pages/show", :formats => [:html]
    end
  end

end