Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :comments
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  #resources :users
  resources :comments
  

  put 'posts/:id/like',  :to => 'posts#like' , as: :like
  get 'posts/:id/dislike',  :to => 'posts#dislike' , as: :dislike


  get 'tags/:tag', to: 'posts#index', as: :tag
  
  get 'profile/:id', to: 'users#show', as: :profile
  

  resources :posts
  resources :relationships,       only: [:create, :destroy]
  
  devise_for :users, :controllers => { :registrations => "registrations" , :omniauth_callbacks => "users/omniauth_callbacks" } 
  
  get '/users/:id/following', :to => 'users#following' , as: :following   #or your route
  get '/users/:id/followers', :to => 'users#followers' , as: :follower #or your route
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#homepage'
end
