Rails.application.routes.draw do

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/delete'
  resources :users, only: [:new, :create, :edit, :update]
  resources :projects, only:[:new, :create, :show, :index, :edit, :destroy]
  post 'projects/addtask'
  # get 'projects/new'
  # post 'projects/create'
  # get 'projects/show'
  # get 'projects/index'
  # get 'projects/edit'
	root 'welcome#index'
  get 'welcome/index'
  resources :projects, only: [:show] do
  	resources :tasks, only: [:edit, :new, :create, :destroy]
  end
  post 'tasks/register'
end
