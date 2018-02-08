Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :comments
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :comments
  resources :posts
  devise_for :users, :controllers => { :registrations => "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'static#homepage'

end
