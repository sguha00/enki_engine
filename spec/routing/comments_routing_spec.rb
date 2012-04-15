require 'spec_helper'

describe 'CommentsController routes' do
  
  it "should route get /2008/02/01/a-post/comments to comments#index with year: 2008, month: 02, day: 01, slug: a-post" do
    get("/2008/02/01/a-post/comments").should route_to("enki/comments#index", :year => '2008', :month => '02', :day => '01', :slug => 'a-post')
  end

  it "should route post /2008/02/01/a-post/comments to comments#create with year: 2008, month: 02, day: 01, slug: a-post" do
    post("/2008/02/01/a-post/comments").should route_to("enki/comments#create", :year => '2008', :month => '02', :day => '01', :slug => 'a-post')
  end

  it "should route /2008/02/01/a-post/comments/nes to comments#new with year: 2008, month: 02, day: 01, slug: a-post" do
    get("/2008/02/01/a-post/comments/new").should route_to("enki/comments#new", :year => '2008', :month => '02', :day => '01', :slug => 'a-post')
  end

end
