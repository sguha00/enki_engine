if Rails.env == 'development'
  module Enki
    Post.destroy_all
    20.times do |idx|
      Post.create!(:title => "Test post #{idx}", :body => "Lorem ipsum plipsum nipsum.")
    end
  end
end
