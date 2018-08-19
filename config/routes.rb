Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:Omniauth_callbacks]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end