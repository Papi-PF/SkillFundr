Rails.application.routes.draw do
  root "pages#landing"
  devise_for :users

  get "/home", to: "pages#home"
  get "/congratulations", to: "pages#congratulations"
  get "/dashboard", to: "pages#dashboard"

  resources :skills, only: [:index, :show]
  resources :learning_paths, only: [:create, :show, :destroy] do
    resources :milestones, only: [:update] do
      member do
        patch :mark_complete
      end
    end
  end

  post '/dashboard', to: 'learning_paths#create_from_skill', as: :create_learning_path_from_skill

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
