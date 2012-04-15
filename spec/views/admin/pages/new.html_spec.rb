require 'spec_helper'

module Enki

  describe "/admin/pages/new.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      assign :page, Page.new
      render :template => '/enki/admin/pages/new', :formats => [:html]
    end
  end

end