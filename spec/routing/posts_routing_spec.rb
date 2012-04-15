require 'spec_helper'

describe 'PostsController routes' do
  
  it "should route /code to posts#index with tag code" do
    get("/tags/code").should route_to("enki/posts#index", :tag => 'code')
  end
    
  it "should route /posts.atmo to posts#index format atom" do
    get("/posts.atom").should route_to("enki/posts#index", :format => 'atom')
  end
    
  it "should route /pages to posts#index with tag pages" do
    get("/pages").should route_to(:controller => 'enki/posts', :action => 'index', :tag => 'pages')
  end
    
  it "should route /code.atmo to posts#index tag: code and format: atom" do
    {:get => "/tags/code.atom"}.should route_to("enki/posts#index", :tag => "code", :format => 'atom')
  end

  it "should route /2008/02/01/a-post to posts#show with year: 2008, month: 02, day: 01, slug: a-post" do
    {:get => "/2008/02/01/a-post"}.should route_to("enki/posts#show", :year => '2008', :month => '02', :day => '01', :slug => 'a-post')
  end

end

