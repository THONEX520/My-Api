Rails.application.routes.draw do
  get "home/index"
  use_doorkeeper
  resources :earthquakes, only: [:index, :show] # Add others later
  
  get "up" => "rails/health#show", as: :rails_health_check


  root to: "home#index"

end
