Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/delete'  

  get 'auth/github/callback' => 'sessions#creategithub'
  get 'users/getcurrentuser'  
  resources :users, only: [:new, :create, :edit, :update, :show]
  
  get 'tasks/pickedup'
  post 'tasks/register'
  resources :tasks, only: [:index]

  post 'projects/addtask'
  resources :projects, only:[:new, :create, :show, :index, :edit, :destroy]

  resources :projects, only: [:show] do
  	resources :tasks, only: [:edit, :new, :create, :destroy]
  end
  
end
