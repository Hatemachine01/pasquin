Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users, controllers: { registrations: 'registrations' }

root 'static#homepage'

end
