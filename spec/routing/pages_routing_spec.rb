require 'spec_helper'

describe 'Enki::PagesController routes' do
      
  it "should recognise show with id" do
    get("/blog/pages/my-page").should route_to('enki/pages#show', :id => 'my-page')
  end
      
  it "should recognise show with id" do
    get("/pages/my-page").should route_to('enki/pages#show', :id => 'my-page')
  end
  
  it "should recognise show with id" do
    get("blog/pages/my-page").should route_to('enki/pages#show', :id => 'my-page')
  end
      
  it "should recognise show with id" do
    get("pages/my-page").should route_to('enki/pages#show', :id => 'my-page')
  end
  
end
