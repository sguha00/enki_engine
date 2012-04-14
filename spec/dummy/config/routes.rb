Dummy::Application.routes.draw do
  
  scope :to => 'enki/posts#index' do
    get '/blag/posts.:format', :as => :formatted_posts
    get '/blag/tags/(:tag)', :as => :posts
  end
  
  
  if defined?(Enki)
    mount Enki::Engine => '/blog', :as => 'enki'
    # mount Enki::Engine => Enki::Config.default[:engine, :mount_at], :as => 'enki'
  end
  
end
