Rails.application.routes.draw do
  root to: 'gifts#index'
  resources :users
  resources :gifts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end