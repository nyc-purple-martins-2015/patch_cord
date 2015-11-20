Rails.application.routes.draw do
  root 'welcome#index'

  get 'register' => 'users#new, as: :register'
  get 'logout' => 'sessions#destroy, as: :logout'
  get 'login' => 'sessions#new, as: :login'

  resources :bands
  resources :genres
  resources :instruments 
  resources :media_resources 
  resources :users 





end
