Rails.application.routes.draw do
  root to: "accounts#new"

  get '/signup' => 'accounts#new'
  post '/accounts' => 'accounts#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


  resources :images
  resources :accounts do
    resources :images
  end
end
