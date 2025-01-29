Rails.application.routes.draw do
  devise_for :users
  resources :enterprises
  resources :payments
  resources :comments
  resources :softwares
  resources :users do
    collection do
      get :create_admin 
    end
  end
  
  root to: "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end

