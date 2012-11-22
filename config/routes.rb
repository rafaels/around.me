AroundMe::Application.routes.draw do
  resources :events, :except => [:create, :update, :destroy]

  authenticated :user do
    root :to => 'home#index'
    resources :events, :only => [:create, :update, :destroy] do
      post :participate, :on => :member
    end
		resources :token_authentications
  end
  root :to => "home#index"

  devise_for :users, :controllers => { :sessions => "sessions" }
  devise_scope :user do
    resources :sessions, :only => [:create, :destroy]
  end

  resources :users
  resources :token_authentications, :only => [:create, :destroy]
end
