Rails.application.routes.draw do
  resources :tags
  resources :quantities
  resources :ingredients
  resources :recipes

  post '/favorites', to: 'favorites#create'
  post '/favorites/:id', to: 'favorites#destroy'
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:Omniauth_callbacks]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end