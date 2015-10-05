Rails.application.routes.draw do
  root 'welcome#show'

  get '/auth/twitter', as: :login

  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', as: :logout, to: 'sessions#destroy'

  get '/lists/archived', as: :archived, to: 'lists#archived'

  put 'lists/:id/archive', as: :archive, to: 'lists#archive'

  resources :lists do
    put '/tasks/:id/task_complete', as: :task_complete, to: 'tasks#task_complete'
    put '/tasks/:id/redo', as: :redo, to: 'tasks#redo'
    get '/tasks/:id/completed_tasks', as: :completed_tasks, to: 'tasks#completed_tasks'
    resources :tasks, except: [:index]
  end

  resources :tags
end
