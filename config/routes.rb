Rails.application.routes.draw do
  root 'landing_pages#top'
  
  get 'login' ,to:'user_sessions#new'
  post 'login' ,to:'user_sessions#create'
  delete 'logout' ,to:'user_sessions#destroy'
  
  resources :users
  resources :gifts

  resources :gifts, except: [:index] do
    resource :likes, only: %i[ create destroy ]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
