require 'spec_helper'

describe 'Enki::PagesController routes' do
      
  it "routes get /pages/my-page to pages#show id: my-page" do
    get("pages/my-page").should route_to('enki/pages#show', :id => 'my-page')
  end
      
end
