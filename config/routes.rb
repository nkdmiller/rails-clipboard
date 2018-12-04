Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/delete'  

  get 'auth/github/callback' => 'sessions#creategithub'
  
  resources :users, only: [:new, :create, :edit, :update, :show]
  get 'users/getcurrentuser'

  resources :tasks, only: [:index]
  get 'tasks/pickedup'
  post 'tasks/register'

  resources :projects, only:[:new, :create, :show, :index, :edit, :destroy]
  post 'projects/addtask'
  resources :projects, only: [:show] do
  	resources :tasks, only: [:edit, :new, :create, :destroy]
  end
  
end
