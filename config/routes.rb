Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'users/new'
  get 'users/edit'
  get 'projects/new'
  get 'projects/show'
  get 'projects/index'
  get 'projects/edit'
	root 'welcome#index'
  get 'welcome/index'
end
