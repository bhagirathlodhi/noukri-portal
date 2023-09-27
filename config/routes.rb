Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  root "jobs#index"
  get '/new_job', to: 'jobs#new'
  get '/edit_job', to: 'jobs#edit'
  delete '/destroy_job', to: 'jobs#destroy'
  
  devise_for :users
  
end
