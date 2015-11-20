Rails.application.routes.draw do
  root 'welcome#index'

  get 'register' => 'users#new, as: :register'
  get 'logout' => 'sessions#destroy, as: :logout'
  # get 'login' => 'sessions#new, as: :login'

  resources :bands
  resources :genres, only: [:create, :new, :show, :destroy]
  resources :instruments, only: [:create, :new, :show, :destroy]
  resources :media_resources
  resources :users

  get '/login', :to => 'sessions#new', :as => :login
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'

end
