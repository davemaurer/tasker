Rails.application.routes.draw do
  root 'welcome#show'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', as: :logout, to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'

  resources :lists
end
