Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/delete'
  get 'users/new'
  post 'users/create'
  get 'users/edit'
  patch 'users/:id', to: 'users#update'
  get 'projects/new'
  post 'projects/create'
  get 'projects/show'
  get 'projects/index'
  get 'projects/edit'
	root 'welcome#index'
  get 'welcome/index'
  resources :projects, only: [:show] do
  	resources :tasks, only: [:edit]
  end
  post 'tasks/register'
end
