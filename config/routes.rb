Rails.application.routes.draw do
  resources :comments
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get '/requests', to: 'requests#index'
  root "jobs#index"
  get 'users/index'
  devise_for :users


  resources :jobs do
    resources :requests do
      get 'accept'
      get 'reject'
    end
  end
end
