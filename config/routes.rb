Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'landing_pages#top'
  
  get 'login' ,to:'user_sessions#new'
  post 'login' ,to:'user_sessions#create'
  delete 'logout' ,to:'user_sessions#destroy'
  resources :password_resets, only: %i[ new create edit update ]
  
  resources :communities
  resources :users
  resources :gifts

  get 'mypage', to: 'mypages#top'
  resource :profile, only: %i[show edit update]

  resources :gifts do
    resource :likes, only: %i[ create destroy ]
    resources :comments, only: %i[ show create edit update destroy ]
  end

  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    root 'dashboards#top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
