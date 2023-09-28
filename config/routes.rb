Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :jobs
  # post '/new_job', to: 'jobs#new'
  # get '/edit_job', to: 'jobs#edit'
  # get '/show_job', to: 'jobs#show'
  # delete '/destroy_job', to: 'jobs#destroy'

  root "welcome#index"
  
  devise_for :users
  
end
