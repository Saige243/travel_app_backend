Rails.application.routes.draw do
  resources :destinations
  resources :trips do
    resources :packing_list_items, only: [:index, :create, :update, :destroy]
    resources :accommodations, only: [:index, :create, :update, :destroy]
    resources :itinerary_items, only: [:index, :create, :update, :destroy]
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Devise routes for user authentication
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # User profile routes
  get 'profile', to: 'users#show'
  patch 'profile', to: 'users#update'

    # Authentication check route
    get 'auth/logged_in', to: 'authentication#logged_in'

  # Optionally define a root path
  # root "some_controller#index"
end
