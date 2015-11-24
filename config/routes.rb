Rails.application.routes.draw do
  root 'welcome#index'
  get '/welcome/edit', :to => 'welcome#edit'
  post '/search', :to => 'welcome#search'

  get 'register', :to => 'users#new', as: :register
  get 'logout', :to => 'sessions#destroy', as: :logout

  resources :bands
  post 'bands/search', :to => 'bands#search'
  get 'mediaresources/:id', :to => 'bands#mediaresources'

  resources :genres, only: [:create, :new, :show, :destroy]
  resources :instruments, only: [:new, :create, :show, :destroy]
  resources :media_resources
  resources :users

  post 'users/search', :to => 'users#search'
  post 'users/:id/email', :to => 'users#email', as: :email_user

  get '/login', :to => 'sessions#new', as: :login
  get 'auth/:provider', :to => 'sessions#new', as: :oauth_login
  get '/auth/:provider/callback', to: 'users#create'
  get '/auth/failure', :to => 'sessions#failure'
end
