Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # post '/new_job', to: 'jobs#new'
  # get '/edit_job', to: 'jobs#edit'
  # get '/show_job', to: 'jobs#show'
  # delete '/destroy_job', to: 'jobs#destroy'

  get '/requests', to: 'requests#index'
  root "jobs#index"
  get 'users/index'
  devise_for :users
  # resources :requests 

  resources :jobs do
    resources :requests do
      get 'accept'
      get 'reject'
    end
  end

  
end
