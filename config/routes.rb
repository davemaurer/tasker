Rails.application.routes.draw do
  root 'welcome#show'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', as: :logout, to: 'sessions#destroy'

  get '/lists/archived', as: :archived, to: 'lists#archived'

  put 'lists/:id/archive', as: :archive, to: 'lists#archive'

  resources :lists
end
