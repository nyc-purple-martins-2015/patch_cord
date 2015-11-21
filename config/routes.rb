Rails.application.routes.draw do
  root 'welcome#index'
  post '/search', :to => 'welcome#search'


  get 'register', :to => 'users#new', as: :register
  get 'logout', :to => 'sessions#destroy', as: :logout

  resources :bands
  resources :genres, only: [:create, :new, :show, :destroy]
  resources :instruments, only: [:new, :create, :show, :destroy]
  resources :media_resources
  resources :users

  get '/login', :to => 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'


end
