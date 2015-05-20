Rails.application.routes.draw do
  root "welcome#index"

  get '/signup', to: 'users#new', as: 'new_user'
  post '/signup', to: 'users#create', as: 'create_user'

  get '/signin', to: 'sessions#new', as: 'new_session'
  get '/dashboard', to: 'sessions#show', as: 'dashboard'
  post '/signin', to: 'sessions#create', as: 'create_session'
  get '/signout', to: 'sessions#destroy', as: 'signout'

  resources :searches
  get '/search/:query' => 'search#show'

  resources :movies, only: [:new, :create]
end
