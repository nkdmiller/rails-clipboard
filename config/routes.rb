Rails.application.routes.draw do

  get 'sessions/new'
  get 'tasks/pickedup'
  get 'tasks/index'
  post 'sessions/create'
  get 'users/getcurrentuser'
  get 'auth/github/callback' => 'sessions#creategithub'
  get 'sessions/delete'
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :projects, only:[:new, :create, :show, :index, :edit, :destroy]
  post 'projects/addtask'
	root 'welcome#index'
  get 'welcome/index'
  resources :projects, only: [:show] do
  	resources :tasks, only: [:edit, :new, :create, :destroy]
  end
  post 'tasks/register'
end
