Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :comments
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :comments
  get 'tags/:tag', to: 'post#index', as: :tag
  resources :posts
  devise_for :users, :controllers => { :registrations => "registrations" , :omniauth_callbacks => "users/omniauth_callbacks"  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'static#homepage'

end
