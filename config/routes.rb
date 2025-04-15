Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Standalone users route (this creates new_user_path)
  resources :users, only: [:new, :create]

  # Nested resources for channels
  resources :channels do
    resources :messages, only: [:index, :create]
    resources :users, only: [:new, :create]  # If you need nested user routes as well
  end

  root "channels#index"
end
