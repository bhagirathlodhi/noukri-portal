Rails.application.routes.draw do
  root "jobs#index"
  get 'jobs/new'
  get 'jobs/edit'
  get 'jobs/destroy'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
