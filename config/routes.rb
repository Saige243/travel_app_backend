Rails.application.routes.draw do
  resources :destinations
  resources :itinerary_items
  resources :trips
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'profile', to: 'users#show'
  patch 'profile', to: 'users#update'



  # Defines the root path route ("/")
  # root "posts#index"
end
