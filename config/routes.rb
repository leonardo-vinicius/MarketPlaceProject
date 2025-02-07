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

  get "onboarding/step1", to: "onboarding#step1"
  get "onboarding/step2", to: "onboarding#step2"
  get "onboarding/recommendations", to: "onboarding#recommendations"
  get 'testing_software/:software_id', to: 'onboarding#testing_software', as: 'testing_software'
  get "home", to: "home#index"
  get "up" => "rails/health#show", as: :rails_health_check


  post "onboarding/step2", to: "onboarding#step2"
  post "onboarding/step3", to: "onboarding#step3"
  post "onboarding/recommendations", to: "onboarding#recommendations"

  delete "onboarding/step2", to: "onboarding#destroy_step2"
  delete "onboarding/step3", to: "onboarding#destroy_step3"

  root to: "onboarding#step1"
end
