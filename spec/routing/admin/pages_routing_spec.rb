require 'spec_helper'

describe 'Enki::Admin::PagesController routes' do
      
  it "routes get /admin/pages to admin/pages#create" do
    get("/admin/pages").should route_to('enki/admin/pages#index')
  end
      
  it "routes post /admin/pages to admin/pages#create" do
    post("/admin/pages").should route_to('enki/admin/pages#create')
  end
      
  it "routes get /admin/pages/new to admin/pages#new" do
    get("/admin/pages/new").should route_to('enki/admin/pages#new')
  end
      
  it "routes get /admin/pages/my-page to admin/pages#show id: my-page" do
    get("/admin/pages/my-page").should route_to('enki/admin/pages#show', :id => 'my-page')
  end
      
  it "routes put /admin/pages/my-page to admin/pages#update id: my-page" do
    put("admin/pages/my-page").should route_to('enki/admin/pages#update', :id => 'my-page')
  end
      
  it "routes delete /admin/pages/my-page to admin/pages#destroy id: my-page" do
    delete("/admin/pages/my-page").should route_to('enki/admin/pages#destroy', :id => 'my-page')
  end
  
end
