Rails.application.routes.draw do
  # Session routes for login/logout
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Standalone user creation route
  resources :users, only: [:new, :create]

  # Nested resources for channels
  resources :channels do
    resources :messages, only: [:index, :create]
    resources :users, only: [:new, :create]  # optional if you want nested user creation
  end

  root "channels#index"
end
