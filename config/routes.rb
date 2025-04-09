Rails.application.routes.draw do
  get "home/index"
  use_doorkeeper
  resources :earthquakes, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create, :index]

  get "up" => "rails/health#show", as: :rails_health_check

 
  post '/signup', to: 'users#create'
  post 'signin', to: 'sessions#create'


  root to: "home#index"

end
