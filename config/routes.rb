Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/delete'
  get 'users/new'
  post 'users/create'
  get 'users/edit'
  get 'projects/new'
  get 'projects/show'
  get 'projects/index'
  get 'projects/edit'
	root 'welcome#index'
  get 'welcome/index'
end
