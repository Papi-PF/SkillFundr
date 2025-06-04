Rails.application.routes.draw do

  root "pages#landing"

  devise_for :users

  get "/home", to: "pages#home"

  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :skills, only: [:index, :show]
  resources :learning_paths, only: [:create, :show, :destroy]
  resources :milestones, only: [:show, :update]
  post '/dashboard', to: 'learning_paths#create_from_skill', as: :create_learning_path_from_skill
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
