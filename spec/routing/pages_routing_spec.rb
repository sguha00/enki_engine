require 'spec_helper'

describe 'Enki::PagesController routes' do
      
  it "routes get /pages to pages#index" do
    get("/pages").should route_to('enki/pages#index')
  end
      
  it "routes post /pages to pages#create" do
    post("/pages").should route_to('enki/pages#create')
  end
      
  it "routes get /pages/new to pages#new" do
    get("/pages/new").should route_to('enki/pages#new')
  end
      
  it "routes get /pages/my-page to pages#show id: my-page" do
    get("pages/my-page").should route_to('enki/pages#show', :id => 'my-page')
  end
      
  it "routes put /pages/my-page to pages#update id: my-page" do
    put("pages/my-page").should route_to('enki/pages#update', :id => 'my-page')
  end
      
  it "routes delete /pages/my-page to pages#destroy id: my-page" do
    delete("pages/my-page").should route_to('enki/pages#destroy', :id => 'my-page')
  end
  
end
