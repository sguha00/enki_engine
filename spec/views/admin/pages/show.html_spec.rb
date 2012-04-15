require 'spec_helper'

module Enki

  describe "/admin/pages/show.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      assign :page, create(:page)
      render :template => '/enki/admin/pages/show', :formats => [:html]
    end
  end

end