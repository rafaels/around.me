AroundMe::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  devise_for :users, :controllers => { :sessions => "sessions" }
  devise_scope :user do
    resources :sessions, :only => [:create, :destroy]
  end

  resources :users
  resources :token_authentications, :only => [:create, :destroy]
end
