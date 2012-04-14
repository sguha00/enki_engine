Enki::Engine.routes.draw do
  scope :module => 'enki' do
    namespace :admin do 

      resources :posts, :pages do
        post 'preview', :on => :collection
      end
      resources :comments
      resources :undo_items do
        post 'undo', :on => :member
      end

      match 'health(/:action)' => 'health', :action => 'index', :as => :health

      root :to => 'dashboard#show'
    end
    resources :archives, :only => [:index]
    resources :pages, :only => [:show]
  end

  
  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    #get ':year/:month/:day/:slug/comments'  => 'enki/comments#index'
    #post ':year/:month/:day/:slug/comments' => 'enki/comments#create'
    #get ':year/:month/:day/:slug/comments/new' => 'enki/comments#new'
    get ':year/:month/:day/:slug' => 'enki/posts#show'
  end

  scope :to => 'enki/posts#index' do
    get 'posts.:format', :as => :formatted_posts
    get 'tags/(:tag)', :as => :posts
  end

  root :to => 'enki/posts#index'
end
