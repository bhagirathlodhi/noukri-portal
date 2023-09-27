Rails.application.routes.draw do
  resources :jobs
  # post '/new_job', to: 'jobs#new'
  # get '/edit_job', to: 'jobs#edit'
  # get '/show_job', to: 'jobs#index'
  # delete '/destroy_job', to: 'jobs#destroy'
  root "jobs#index"
  
  devise_for :users
  
end
